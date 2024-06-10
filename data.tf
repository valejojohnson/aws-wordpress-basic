data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_groups" "private" {
  filter {
    name   = "group-name"
    values = ["*Private*"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_groups" "public" {
  filter {
    name   = "group-name"
    values = ["*Public*"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "latest_bitnami_wordpress" {
  most_recent = true
  owners      = ["679593333241"]  # Bitnami's AWS account ID

  filter {
    name   = "name"
    values = ["bitnami-wordpress-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}