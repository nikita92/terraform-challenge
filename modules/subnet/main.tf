resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = var.vpc_id
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private1" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = var.vpc_id
  availability_zone = "us-west-2b"

  tags = {
    Name = "PrivateSubnet1"
  }
}

resource "aws_subnet" "private2" {
  cidr_block = "10.0.3.0/24"
  vpc_id     = var.vpc_id
  availability_zone = "us-west-2c"

  tags = {
    Name = "PrivateSubnet2"
  }
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id]
}
