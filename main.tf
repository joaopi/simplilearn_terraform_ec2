provider "aws" {
  profile = "default"
  region = var.region
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  create_key_pair = var.create_key_pair

  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh

  provisioner "local-exec" { # Create a private key ".pem" to your computer
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./${var.key_name}.pem"
  }
  
  tags = {
    "Terraform" = "true"
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow ssh and standard http/https ports inbound and everything outbound"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" = "true"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  security_groups = [aws_security_group.jenkins_sg]
  key_name = var.key_name
  
  provisioner "remote-exec" {
    # install Java, Python, Jenkins, and configure port forwarding from port 80 to 8080 to access Jenkins publicly
    inline = [
      "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -",
      "sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt update -qq",
      "sudo apt install -y openjdk-11-jdk",
      "sudo apt install -y python",
      "sudo apt install -y jenkins",
      "sudo systemctl start jenkins",
      "sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080",
      "sudo sh -c \"iptables-save > /etc/iptables.rules\"",
      "echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections",
      "echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections",
      "sudo apt-get -y install iptables-persistent",
      "sudo ufw allow 8080",
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.ssh_user_name
    private_key = file(var.ssh_private_key_file)
  }
  
  tags = {
    Name = var.instance_name
    "Terraform" = "true"
  }
}
