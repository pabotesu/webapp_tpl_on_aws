resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "${var.vpc-id}"
    service_name = "com.amazonaws.ap-northeast-1.s3"
    route_table_ids = ["${var.public-route-table-id}"]
}