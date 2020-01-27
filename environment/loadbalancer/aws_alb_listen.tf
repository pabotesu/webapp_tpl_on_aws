resource "aws_alb_listener" "webserver-alb-listener" {
  load_balancer_arn = "${aws_alb.webserver-alb.arn}"
  port = "80"
  protocol = "HTTP"
 
  default_action {
    target_group_arn = "${aws_alb_target_group.webserver-alb-tg.arn}"
    type = "forward"
  }
}

##ALB (listen add target group 443) 
#resource "aws_alb_listener" "webserver-alb" {
#  load_balancer_arn = "${aws_alb.webserver-alb.arn}"
#  port = "443"
#  protocol = "HTTPS"
#  ssl_policy = ""
#  certificate_arn = "${}"
# 
#  default_action {
#    target_group_arn = "${aws_alb_target_group.webserver-alb}"
#    type = "forward"
#  }
#}

resource "aws_alb_listener_rule" "webserver-alb" {
  listener_arn = "${aws_alb_listener.webserver-alb-listener.arn}"
  priority = 100

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.webserver-alb-tg.arn}"
  }

  condition {
    path_pattern{
    values = ["/target/*"]
    }
  }
}
