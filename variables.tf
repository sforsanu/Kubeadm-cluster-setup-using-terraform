variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  default     = "ami-0866a3c8686eaeeba"  # Ubuntu 24.04 AMI
}

variable "instance_type" {
  description = "The type of instance to deploy"
  default     = "t2.medium"
}

variable "ssh_private_key" {
  description = "Path to your SSH private key"
  default     = "C:/Users/HP/Downloads/us-key-pair.pem"
}

variable "ssh_public_key" {
  description = "Path to your SSH public key"
  default     = "~/.ssh/id_rsa.pub"  # Update this if you have a public key, or comment it out if not needed.
}
variable "vpc_id" {
  default = "vpc-01b929e6919495ab8"
  
}
variable "aws_subnet" {
  default = "subnet-06e2aea5746bf0042"
}