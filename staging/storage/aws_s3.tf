resource "random_id" "random_id_for-s3-name" {
  byte_length = 8
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket    = "${lookup(var.s3-config, "name")}-${random_id.random_id_for-s3-name.hex}"
  acl       = "private"

  tags = {
    Name        = "${var.project-name}"
  }
}


