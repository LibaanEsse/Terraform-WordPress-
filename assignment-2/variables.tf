
variable "region" {
  description = "AWS region to deploy resources"
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0379821d182aac933"
}

variable "key_name" {
  description = "AWS key pair name for SSH access"
  default     = "mykeypair"
}


