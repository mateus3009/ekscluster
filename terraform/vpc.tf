resource "aws_vpc" "kubernets" {
  cidr_block                       = "192.168.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "kubernets"
  }
}
