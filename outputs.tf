output "instance_ami" {
  description = "The Instance AMI."
  value = aws_instance.jenkins.ami
}

output "instance_arn" {
  description = "The Instance ARN."
  value = aws_instance.jenkins.arn
}

output "instance_jenkins_url" {
  description = "The Jenkins URL."
  value = "http://${aws_instance.jenkins.public_dns}:8080"
}


output "key_pair_key_name" {
  description = "The key pair name."
  value       = aws_key_pair.generated_key.key_name
}

output "key_pair_key_pair_id" {
  description = "The key pair ID."
  value       = aws_key_pair.generated_key.key_pair_id
}

output "key_pair_fingerprint" {
  description = "The MD5 public key fingerprint."
  value       = aws_key_pair.generated_key.fingerprint
}
