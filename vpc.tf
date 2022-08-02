

#Internet VPC

resource "aws_vpc" "main11" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main11"
   }
}


# Subnets

resource "aws_subnet" "main-public-11" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-public-11"
   }

}



resource "aws_subnet" "main-public-12" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "main-public-12"

   }

}



resource "aws_subnet" "main-public-13" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "main-public-13"

  }

}


resource "aws_subnet" "main-private-11" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1d"

  tags = {
    Name = "main-private-11"
   }

}


resource "aws_subnet" "main-private-12" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1e"

  tags = {

    Name = "main-private-12"

   }

}


resource "aws_subnet" "main-private-13" {
  vpc_id                  = aws_vpc.main11.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1d"

  tags = {
    Name = "main-private-13"
   }

}


# Internet GW

resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main11.id
  tags = {
    Name = "main"
   }

}

# route tables

resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main11.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    Name = "main-public-1"
   }

}


# route associations public

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-11.id
  route_table_id = aws_route_table.main-public.id

}


resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.main-public-12.id
  route_table_id = aws_route_table.main-public.id

}


resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.main-public-13.id
  route_table_id = aws_route_table.main-public.id

}
