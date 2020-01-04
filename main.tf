
provider "aws" {
  version = "~> 2.43"
  region = var.region
}
 
locals {
 common_tags = {
   Name = "${var.tag_name}"
 }
}

resource "aws_vpc" "test-vpc"{
  cidr_block = "192.168.0.0/16"
}

resource "aws_internet_gateway" "test-igw"{
  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_subnet" "test-subnet"{
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "${var.region}a"
}

resource "aws_route_table" "test-rt"{
  vpc_id = aws_vpc.test-vpc.id
  route {
    cidr_block = var.cidr-0
    gateway_id = aws_internet_gateway.test-igw.id
  }
}

resource "aws_route_table_association" "test-rta"{
  subnet_id = aws_subnet.test-subnet.id
  route_table_id = aws_route_table.test-rt.id
}


resource "aws_eip" "test-eip"{
  instance = aws_instance.test-t2.id
  vpc = true
  depends_on = [aws_internet_gateway.test-igw]
}

