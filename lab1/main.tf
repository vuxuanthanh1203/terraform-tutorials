provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "lab-key" {
  key_name = "lab-key"
  public_key  = file("./keypair/lab-key.pub")
}

resource "aws_security_group" "test-security-group" {
  name        = "test-security-group"
  description = "test-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo-instance" {
  ami           = "ami-0f935a2ecd3a7bd5c"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.lab-key.key_name
  tags = {
    Name = "Udemy Lab Demo"
    Domain = "Learn DevOps"
  }
  vpc_security_group_ids = [aws_security_group.test-security-group.id]
}