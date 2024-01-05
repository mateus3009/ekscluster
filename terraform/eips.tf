resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.kubernets]
  tags = {
    Name = "eip-public-sa-east-1a"
  }
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.kubernets]
  tags = {
    Name = "eip-public-sa-east-1b"
  }
}
