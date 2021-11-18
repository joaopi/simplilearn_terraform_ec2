# Simplilearn Terraform EC2 Project
This is a Terraform configuration to implement the Simplilearn project: Automating Infrastructure using Terraform


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


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ami"></a> [instance\_ami](#output\_instance\_ami) | The Instance AMI. |
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | The  Instance ARN. |
| <a name="output_instance_jenkins_url"></a> [instance\_jenkins_url](#output\_instance\_jenkins_url) | The Jenkins URL. |
| <a name="output_key_pair_fingerprint"></a> [key\_pair\_fingerprint](#output\_key\_pair\_fingerprint) | The MD5 public key fingerprint. |
| <a name="output_key_pair_key_name"></a> [key\_pair\_key\_name](#output\_key\_pair\_key\_name) | The key pair name. |
| <a name="output_key_pair_key_pair_id"></a> [key\_pair\_key\_pair\_id](#output\_key\_pair\_key\_pair\_id) | The key pair ID. |
