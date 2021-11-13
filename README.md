# Simplilearn Terraform EC2 Project
This is an example Terraform configuration intended for the Simplilearn project: Automating Infrastructure using Terraform


## What will this do?

This is a Terraform configuration that will create an EC2 instance in your AWS account, connect to the instance and install Jenkins, Java, and Python in the instance

## What are the prerequisites?

You must have an AWS account and provide your AWS Access Key ID and AWS Secret Access Key. 

The values for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` should be saved as environment variables.

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.60 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | ../../ |  |
| <a name="module_key_pair_external"></a> [key\_pair\_external](#module\_key\_pair\_external) | ../../ |  |

## Resources

| Name | Type |
|------|------|
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

