output "webserver-ids" {
  value = ["${aws_instance.web-server.*.id}"]
}