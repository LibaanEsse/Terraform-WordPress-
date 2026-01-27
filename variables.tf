# -----------------------------
# VPC variables
# -----------------------------
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    Name        = "main-vpc"
    Environment = "dev"
  }
}

# -----------------------------
# Subnet variables
# -----------------------------
variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "subnet_tags" {
  type = map(string)
  default = {
    Name        = "main-subnet"
    Environment = "dev"
  }
}

# -----------------------------
# Internet Gateway (IGW) variables
# -----------------------------
variable "igw_tags" {
  type = map(string)
  default = {
    Name = "main-igw"
  }
}

# -----------------------------
# Route Table variables
# -----------------------------
variable "route_table_tags" {
  type = map(string)
  default = {
    Name = "main-rt"
  }
}

# -----------------------------
# Security Group variables
# -----------------------------
variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "egress_rules" {
  description = "Egress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

# -----------------------------
# AWS Key Pair variables
# -----------------------------
variable "key_name" {
  type = string
  default = "my-key"
}

variable "public_key" {
  type = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name        = "main-ec2"
    Environment = "dev"
  }
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "user_data_path" {
  description = "Path to user-data script"
  type        = string
  default     = null
}


