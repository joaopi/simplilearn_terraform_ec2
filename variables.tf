variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "jenkins"
}

variable "ssh_user_name" {
  description = "SSH user name"
  default     = "ubuntu"
}

variable "ssh_private_key_file" {
  description = "SSH private key file"
  default     = "~/pvkey.pem"
}

