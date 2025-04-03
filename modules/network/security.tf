resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.main.id
  name   = "allow_http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-allow-http"
  }
}
