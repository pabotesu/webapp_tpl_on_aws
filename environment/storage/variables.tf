variable "project-name" {
  default     = ""
}
variable "vpc-id" {
  default     = ""
}

variable "public-route-table-id" {
  default     = ""
}


 variable "s3-config"{
    type = "map"
      default = {
          name       = ""
      }
  }
