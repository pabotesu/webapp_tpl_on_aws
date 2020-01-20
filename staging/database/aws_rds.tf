resource "aws_db_instance" "rds" {
    identifier = "${var.project-name}-db"
    allocated_storage = "${lookup(var.rds-config, "allocated_storage")}"
    engine = "${lookup(var.rds-config, "engine")}"
    engine_version = "${lookup(var.rds-config, "engine_version")}"
    instance_class = "${lookup(var.rds-config, "instance_class")}"
    name = "${var.project-name}"
    username = "${lookup(var.rds-config, "username")}"
    password = "${lookup(var.rds-config, "password")}"
    db_subnet_group_name = "${aws_db_subnet_group.rds-subnet.name}"
    vpc_security_group_ids = ["${var.sg-for_rds-id}"]
    //parameter_group_name = "${aws_db_parameter_group.rds-pg.name}"
    multi_az = "${lookup(var.rds-config, "multi_az")}"
    backup_retention_period = "${lookup(var.rds-config, "backup_retention_period")}"
    backup_window = "${lookup(var.rds-config, "backup_window")}"
    apply_immediately = "${lookup(var.rds-config, "apply_immediately")}"
    auto_minor_version_upgrade = "${lookup(var.rds-config, "auto_minor_version_upgrade")}"
    skip_final_snapshot = true
}