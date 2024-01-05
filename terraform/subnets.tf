resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.kubernets.id
  cidr_block              = "192.168.0.0/18"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "public-sa-east-1a"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.kubernets.id
  cidr_block              = "192.168.64.0/18"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "public-sa-east-1b"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.kubernets.id
  cidr_block              = "192.168.128.0/18"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "private-sa-east-1a"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.kubernets.id
  cidr_block              = "192.168.192.0/18"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "private-sa-east-1b"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
