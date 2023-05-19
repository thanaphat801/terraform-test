resource "aws_security_group" "my_alb_sg" {
  name        = "public-alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-alb-sg"
  }
}

resource "aws_security_group" "my_ssh_sg" {
  name        = "ssh-sg"
  description = "Security group for ssh"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-sg"
  }
}

resource "aws_security_group" "my_app_sg" {
  name        = "app-sg"
  description = "Security group for app"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}
