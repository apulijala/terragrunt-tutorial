resource "aws_security_group_rule" "ssh_rule" {

  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.default_group.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "http_rule" {

  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.default_group.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]

}



resource "aws_security_group_rule" "default_egress_rule" {

  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.default_group.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]

}


