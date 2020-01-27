/*aws-vpc-settings*/
variable "project-name" {
  default     = "test"
}
variable "vpc-cidr" {
  default     = "10.0.0.0/16"
}

variable "az" {
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}


variable "public-subnets" {
  default     = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "private-subnets" {
  default     = ["10.0.1.0/24","10.0.3.0/24"]
}

variable "ec2-config" {
      type = "map"
      default = {
          ami = "ami-0ff21806645c5e492"
          instance_type = "t2.micro"
          instance_key = "key_key"
          root_ebs_type = "gp2"
          root_ebs_size = "8"
          block_ebs_name = "/dev/sdx"
          block_ebs_type = "gp2"
          block_ebs_size = "8"
      }
  }

variable "rds-config" {
      type = "map"
      default = {
          allocated_storage       = 10
          storage_type            = "gp2"
          engine                  = "mysql"
          engine_version          = "8.0.16"
          instance_class          = "db.t3.small"
          name                    = "mydb"
          username                = "foo"
          password                = "foobarbaz"
          parameter_group_name    = "default.mysql5.6"
          multi_az                = "true"
          backup_retention_period = "7"
          //バックアップ保存期間
          backup_window           = "19:00-19:30"
          //バックアップする時間帯
          apply_immediately       = "true"
          auto_minor_version_upgrade = "false"
          storage_encrypted = "true"
          //暗号化
      }
  }

  variable "s3-config"{
    type = "map"
      default = {
          name       = "test-images"
      }
  }
