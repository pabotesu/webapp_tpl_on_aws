resource "aws_db_subnet_group" "rds-subnet" {
    name = "${var.project-name}-rds-subnet-group"
    description = "${var.project-name}-rds-subnet-group"
    subnet_ids = var.private-subnets-ids[0]
}
