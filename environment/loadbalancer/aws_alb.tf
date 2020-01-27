resource "aws_alb" "webserver-alb" {
  name              = "${var.project-name}"
  security_groups   = ["${var.sg-for_alb-id}"]
  subnets           = var.public-subnets-ids[0]
  internal                   = false
  enable_deletion_protection = false
}


