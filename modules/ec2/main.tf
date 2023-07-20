resource "aws_security_group" "allow_ssh" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.private1.id, aws_security_group.private2.id]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  subnet_id     = var.private_subnets[0]  # Launch the EC2 instance in the first private subnet

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

output "ec2_instance_ip" {
  value = aws_instance.ec2_instance.public_ip
}
