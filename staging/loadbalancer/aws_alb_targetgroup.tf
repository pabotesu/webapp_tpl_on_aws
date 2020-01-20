resource "aws_alb_target_group" "webserver-alb-tg" {
  name     = "${var.project-name}-webserver-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc-id}"
 
  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
    matcher             = 200
  }
}

resource "aws_alb_target_group_attachment" "webserver-alb-tg" {
  count            = "${length(var.webserver-ids[0])}"
  target_group_arn = "${aws_alb_target_group.webserver-alb-tg.arn}"
  target_id        = "${element(var.webserver-ids[0], count.index)}"
  port             = 80
}