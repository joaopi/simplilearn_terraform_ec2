output "instance_ami" {
  description = "The Instance AMI."
  value = aws_instance.jenkins.ami
}

output "instance_arn" {
  description = "The Instance ARN."
  value = aws_instance.jenkins.arn
}

output "key_pair_key_name" {
  description = "The key pair name."
  value       = module.key_pair.key_pair_key_name
}

output "key_pair_key_pair_id" {
  description = "The key pair ID."
  value       = module.key_pair.key_pair_key_pair_id
}

output "key_pair_fingerprint" {
  description = "The MD5 public key fingerprint."
  value       = module.key_pair.key_pair_fingerprint
}
