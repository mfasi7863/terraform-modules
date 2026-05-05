provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Get AZs
data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

# Public Subnets (Multi-AZ)
resource "aws_subnet" "public" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnets, count.index)

  availability_zone = local.azs[count.index]

  map_public_ip_on_launch = true
}

# Private Subnets (Multi-AZ)
resource "aws_subnet" "private" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnets, count.index)

  availability_zone = local.azs[count.index]
}
