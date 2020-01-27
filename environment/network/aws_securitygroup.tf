
/*webサーバ用のセキュリティグループ*/
resource "aws_security_group" "for_webserver" {
  name        = "${var.project-name}-for-webserver-sg"
  description = "${var.project-name}-for-webserver-sg"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = {
        Name = "${var.project-name}-instance-sg"
    }

}

resource "aws_security_group_rule" "webserver-inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  
  security_group_id = "${aws_security_group.for_webserver.id}"
}

resource "aws_security_group_rule" "webserevr-inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = "${aws_security_group.for_webserver.id}"
}

resource "aws_security_group_rule" "webserevr-inbound_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = "${aws_security_group.for_webserver.id}"
}

resource "aws_security_group_rule" "webserevr-inbound_mysql" {
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  
  security_group_id = "${aws_security_group.for_webserver.id}"
}

  resource "aws_security_group_rule" "webserevr-outbound_mysql" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.for_webserver.id}"
  }
   



/*DB用のセキュリティグループ*/

resource "aws_security_group" "for_rds" {
  name        = "${var.project-name}-for-rds-sg"
  description = "${var.project-name}-for-rds-sg"
  vpc_id      = "${aws_vpc.vpc.id}"

    tags = {
        Name = "${var.project-name}-rds-sg"
    }

}

resource "aws_security_group_rule" "rds-inbound_mysql" {
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  source_security_group_id = "${aws_security_group.for_webserver.id}"

  
  security_group_id = "${aws_security_group.for_rds.id}"
}

  resource "aws_security_group_rule" "rds-outbound_mysql" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.for_rds.id}"
  }



/*LB用のセキュリティグループ*/
resource "aws_security_group" "for_alb" {
  name        = "${var.project-name}-for-alb-sg"
  description = "${var.project-name}-for-alb-sg"
  vpc_id      = "${aws_vpc.vpc.id}"

    tags = {
        Name = "${var.project-name}-alb-sg"
    }

}

resource "aws_security_group_rule" "alb-inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  
  security_group_id = "${aws_security_group.for_alb.id}"
}

resource "aws_security_group_rule" "alb-inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

 
  security_group_id = "${aws_security_group.for_alb.id}"
}

  resource "aws_security_group_rule" "alb-outbound_mysql" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.for_alb.id}"
  }