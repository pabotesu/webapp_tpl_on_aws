/*aws-name-settings*/
variable "project-name" {
  default     = "minecraft"
}

/*aws-network-settings*/
variable "vpc-cidr" {
  default     = "192.168.32.0/24"
}

variable "az" {
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}


variable "public-subnets" {
  default     = ["192.168.32.0/25"]
}

variable "private-subnets" {
  default     = ["192.168.32.128/25"]
}

/*aws-instance-settings*/
variable "ec2-config" {
      type = map(string)
      default = {
          ami = "ami-0ff21806645c5e492"
          instance_type = "t2.small"
          instance_key = "mykey"
          root_ebs_type = "gp2"
          root_ebs_size = "8"
      }
  }


