output "webserver-ids" {
  value = ["${aws_instance.server.*.id}"]
}