# Simplilearn Terraform EC2 Project
This is a Terraform configuration to implement the Simplilearn project: Automating Infrastructure using Terraform

The source code is in github repository: https://github.com/joaopi/simplilearn_terraform_ec2

## What will this do?

This is a Terraform configuration that will create an EC2 instance in your AWS account, create security keys for SSH, connect to the instance and install Jenkins, Java, and Python in the instance.

It installs Java JDK from APT package `default-jdk`, and installs Python8.

Jenkins server will be available on `http://<EC2-public-ip>:8080`

## What are the prerequisites?

You must have an AWS account and provide your AWS Access Key ID, AWS Secret Access Key and AWS Security Token.

The values for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_SESSION_TOKEN` should be saved as environment variables.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.60.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.60.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.jenkins_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_key_pair"></a> [create\_key\_pair](#input\_create\_key\_pair) | Create key pair conditionally | `bool` | `true` | no |
| <a name="input_ingress_port_rules"></a> [ingress\_port\_rules](#input\_ingress\_port\_rules) | n/a | `list(number)` | <pre>[<br>  8080,<br>  443,<br>  22<br>]</pre> | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | EC2 instance name | `string` | `"jenkins"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of EC2 instance to provision | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key pair name | `string` | `"my_key_pair"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_ssh_private_key_file"></a> [ssh\_private\_key\_file](#input\_ssh\_private\_key\_file) | SSH private key file | `string` | `"~/my_key_pair.pem"` | no |
| <a name="input_ssh_user_name"></a> [ssh\_user\_name](#input\_ssh\_user\_name) | SSH user name | `string` | `"ubuntu"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ami"></a> [instance\_ami](#output\_instance\_ami) | The Instance AMI. |
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | The Instance ARN. |
| <a name="output_instance_jenkins_url"></a> [instance\_jenkins\_url](#output\_instance\_jenkins\_url) | The Jenkins URL. |
| <a name="output_key_pair_fingerprint"></a> [key\_pair\_fingerprint](#output\_key\_pair\_fingerprint) | The MD5 public key fingerprint. |
| <a name="output_key_pair_key_name"></a> [key\_pair\_key\_name](#output\_key\_pair\_key\_name) | The key pair name. |
| <a name="output_key_pair_key_pair_id"></a> [key\_pair\_key\_pair\_id](#output\_key\_pair\_key\_pair\_id) | The key pair ID. |
