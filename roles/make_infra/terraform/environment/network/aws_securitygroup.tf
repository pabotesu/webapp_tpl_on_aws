
/*webサーバ用のセキュリティグループ*/
resource "aws_security_group" "for_server" {
  name        = "${var.project-name}-for-server-sg"
  description = "${var.project-name}-for-server-sg"
  vpc_id      = aws_vpc.vpc.id

  tags = {
        Name = "${var.project-name}-instance-sg"
    }

}

resource "aws_security_group_rule" "server-inbound_minecraft" {
  type        = "ingress"
  from_port   = 25565
  to_port     = 25565
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  
  security_group_id = aws_security_group.for_server.id
}



resource "aws_security_group_rule" "serevr-inbound_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = aws_security_group.for_server.id
}

resource "aws_security_group_rule" "serevr-inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = aws_security_group.for_server.id
}

resource "aws_security_group_rule" "serevr-inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = aws_security_group.for_server.id
}

  resource "aws_security_group_rule" "serevr-outbound" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]


    security_group_id = aws_security_group.for_server.id
  }
   