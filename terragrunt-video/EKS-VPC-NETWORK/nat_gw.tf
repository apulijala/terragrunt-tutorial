resource "aws_nat_gateway" "nat_gw" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)
  depends_on    = [aws_subnet.public_subnets, aws_eip.nat_eip]

  tags = {
    "Name" = "${var.environment}-nat-gw"
  }
}

