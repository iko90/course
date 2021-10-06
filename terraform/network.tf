resource "aws_vpc" "exzample-vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"

  tags = {
    "Name" = "exzample-vpc"
  }
}

resource "aws_subnet" "exzample-subnet-public-1" {
  vpc_id                  = aws_vpc.exzample-vpc.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    "Name" = "exzample-subnet-public-1"
  }
}

resource "aws_subnet" "exzample-subnet-public-2" {
  vpc_id                  = aws_vpc.exzample-vpc.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    "Name" = "exzample-subnet-public-2"
  }
}

resource "aws_internet_gateway" "exzample-igw" {
  vpc_id = aws_vpc.exzample-vpc.id

  tags = {
    "Name" = "exzample-igw"
  }
}

resource "aws_route_table" "exzample-public-crt" {
  vpc_id = aws_vpc.exzample-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.exzample-igw.id
  }

  tags = {
    Name = "exzample-public-crt"
  }
}

resource "aws_route_table_association" "exzample-crta-public-subnet-1" {
  subnet_id      = aws_subnet.exzample-subnet-public-1.id
  route_table_id = aws_route_table.exzample-public-crt.id
}

resource "aws_route_table_association" "exzample-crta-public-subnet-2" {
  subnet_id      = aws_subnet.exzample-subnet-public-2.id
  route_table_id = aws_route_table.exzample-public-crt.id
}


resource "aws_security_group" "exzample-all" {
  vpc_id = aws_vpc.exzample-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "exzample-all"
  }
}