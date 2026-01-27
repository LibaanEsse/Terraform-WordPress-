resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = var.vpc_tags
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = var.subnet_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.igw_tags
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id   # <-- correct
  tags   = var.route_table_tags
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

