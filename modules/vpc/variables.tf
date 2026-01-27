# VPC variables
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    Name = "main-vpc"
  }
}

# Subnet variables
variable "subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_tags" {
  type = map(string)
  default = {
    Name = "main-subnet"
  }
}

# Internet Gateway variables
variable "igw_tags" {
  type = map(string)
  default = {
    Name = "main-igw"
  }
}

# Route Table variables
variable "route_table_tags" {
  type = map(string)
  default = {
    Name = "main-rt"
  }
}

