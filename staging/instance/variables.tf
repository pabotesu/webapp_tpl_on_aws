variable "project-name" {
  default     = ""
}
variable "vpc-id" {
  default     = ""
}

variable "az" {
  default     = ""
}

variable "public-subnets-ids" {
  default     = ""
}

variable "private-subnets-ids" {

  default     = ""
}

variable "sg-for_webserver-id" {

  default     = ""
}

variable "ec2-config" {
      type = "map"
      default = {
          ami = ""
          instance_type = ""
          instance_key = ""
          root_ebs_type = ""
          root_ebs_size = ""
          block_ebs_name = ""
          block_ebs_type = ""
          block_ebs_size = ""
      }
  }