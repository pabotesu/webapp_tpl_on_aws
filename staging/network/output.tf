output "private-subnets-ids" {
  value = ["${aws_subnet.private-subnet.*.id}"]
}

output "public-subnets-ids" {
  value = ["${aws_subnet.public-subnet.*.id}"]
}

output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "public-route-table-id" {
  value = "${aws_route_table.public-route-table.id}"
}


output "sg-for_webserver-id" {
  value = "${aws_security_group.for_webserver.id}"
}

output "sg-for_rds-id" {
  value = "${aws_security_group.for_rds.id}"
}

output "sg-for_alb-id" {
  value = "${aws_security_group.for_alb.id}"
}