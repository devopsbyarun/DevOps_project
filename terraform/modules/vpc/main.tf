resource "aws_vpc" "dev-practice" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
    tags = {
        Name = var.vpc_name
    }

}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-practice
  tags = {
    Name = "dev-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.dev-practice
  cidr_block = "10.0.1.1/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.dev-practice
  cidr_block = "10.0.2.1/24"
    availability_zone = "us-east-1a"
    tags = {
        Name= "private-subnet"
}
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev-practice
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id = aws_subnet.public_subnet
  route_table_id = aws_route_table.public_rt
}
