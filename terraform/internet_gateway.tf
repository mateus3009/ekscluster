resource "aws_internet_gateway" "kubernets" {
  vpc_id = aws_vpc.kubernets.id

  tags = {
    Name = "kubernets"
  }
}
