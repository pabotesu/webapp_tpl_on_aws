resource "aws_instance" "web-server" {
    count =  "${length(var.public-subnets-ids[0])}"
    ami = "${lookup(var.ec2-config, "ami")}"
    instance_type = "${lookup(var.ec2-config, "instance_type")}"
    key_name = "${lookup(var.ec2-config, "instance_key")}"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${var.sg-for_webserver-id}"]
    subnet_id = "${var.public-subnets-ids[0] [count.index]}"
    root_block_device {
        volume_type = "${lookup(var.ec2-config, "root_ebs_type")}"
        volume_size = "${lookup(var.ec2-config, "root_ebs_size")}"
    }
    /*
    ebs_block_device {
        device_name = "${lookup(var.ec2-config, "block_ebs_name")}"
        volume_type = "${lookup(var.ec2-config, "block_ebs_type")}"
        volume_size = "${lookup(var.ec2-config, "block_ebs_size")}"
    }
    */
    tags = {
       Name = "${var.project-name}-public-${element(var.az, count.index)}"
    }
  }