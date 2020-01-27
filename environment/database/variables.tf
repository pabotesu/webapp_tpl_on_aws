
variable "project-name" {
  default     = ""
}
variable "vpc-id" {
  default     = ""
}

variable "az" {
  default     = ""
}


variable "private-subnets-ids" {

  default     = ""
}

variable "sg-for_rds-id" {

  default     = ""
}

variable "rds-config" {
      type = "map"
      default = {
          allocated_storage       = ""
          storage_type            = ""
          engine                  = ""
          engine_version          = ""
          instance_class          = ""
          name                    = ""
          username                = ""
          password                = ""
          parameter_group_name    = ""
          multi_az                = ""
          backup_retention_period = ""
          backup_window           = ""
          apply_immediately       = ""
          auto_minor_version_upgrade = ""
      }
  }