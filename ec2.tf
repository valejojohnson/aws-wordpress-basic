# Create the Server

resource "aws_instance" "this" {
  ami           = data.aws_ami.latest_bitnami_wordpress.image_id
  instance_type = "t2.micro"
  associate_public_ip_address = true # Temporarily true until I pair with ELB
  key_name = "superkey"

  # Add the private security group to the EC2 instance
  vpc_security_group_ids = [aws_security_group.private.id]

  tags = {
    Name = "${random_pet.this.id}-wordpress-svr"
  }
}

resource "aws_security_group" "private" {
  name        = "${random_pet.this.id}-private-sg"
  description = "Allow traffic to the EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}