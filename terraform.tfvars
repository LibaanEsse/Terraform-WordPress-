ami_id        = "ami-0f321d890424a6390"
instance_type = "t3.micro"
key_name      = "mykeypair"

associate_public_ip_address = true

public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIDCFIsOBEcqxlETZBfW0NDOuKgZ6HVy/VxjlaHWOykC libaan.esse@gmail.com"

vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.0.0/24"

vpc_tags = {
  Name = "main"
}

subnet_tags = {
  Name = "main"
}

igw_tags = {
  Name = "main"
}

route_table_tags = {
  Name = "main"
}

ec2_tags = {
  Name = "WordPress"
}

# Security Group Rules
ingress_rules = [
  {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# User Data Script
user_data_path = "scripts/user_data.sh"

