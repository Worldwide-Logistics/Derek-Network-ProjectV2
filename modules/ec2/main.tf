data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}

resource "aws_instance" "ec2" {
  ami                  = data.aws_ami.amzn2.id
  instance_type        = "t3.micro"
  key_name             = var.ssh_key_name
  tags = {
    Name = var.name
  }
  vpc_security_group_ids = [
    var.ssh_security_group_id
  ]
  subnet_id = var.subnet_id
}

resource "aws_eip" "ip" {
  instance = aws_instance.ec2.id
  vpc = true
}