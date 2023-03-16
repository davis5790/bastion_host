
resource "aws_instance" "bastion_host" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = "Bastion-key"
  subnet_id              = var.public_subnet_id_2
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion sg"
  description = "Allow SSH traffic on port 22"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["69.232.56.223/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "private_instance" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = "Private-key"
  subnet_id              = var.private_subnet_id_2
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  tags = {
    Name = "Private Instance"
  }
}

resource "aws_security_group" "private_instance_sg" {
  name        = "private_sg"
  description = "Allow traffic from bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from bastion sg"
    from_port       = 22
    to_port         = 22
    protocol        = "TCP"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

