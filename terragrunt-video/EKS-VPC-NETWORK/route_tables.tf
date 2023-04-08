resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    "Name" = "${var.environment}-public-rt"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    "Name" = "${var.environment}-private-rt"
  }
}

resource "aws_route" "public_igw" {

  // vpc_id                 = aws_vpc.eks_vpc.id
  route_table_id         = aws_route_table.public_route.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_internet_gateway.igw
  ]

}

resource "aws_route" "private_nat" {

  // vpc_id                 = aws_vpc.eks_vpc.id
  route_table_id         = aws_route_table.private_route.id
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_nat_gateway.nat_gw
  ]

}


resource "aws_route_table_association" "public_association" {

  route_table_id = aws_route_table.public_route.id
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  count          = length(var.public_subnets)

}

resource "aws_route_table_association" "private_association" {

  route_table_id = aws_route_table.private_route.id
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  count          = length(var.private_subnets)

}
