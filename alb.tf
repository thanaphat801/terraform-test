resource "aws_alb" "my_alb" {
  name            = "public-alb"
  subnets         = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  security_groups = [aws_security_group.my_alb_sg.id]
}