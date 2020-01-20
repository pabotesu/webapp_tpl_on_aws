module "aws_vpc" {
  source = "./network/"

  #Set Palamater
  project-name     = "${var.project-name}"
  vpc-cidr         = "${var.vpc-cidr}"
  az               = "${var.az}"
  public-subnets   = "${var.public-subnets}"
  private-subnets  = "${var.private-subnets}"
}

module "aws_ec2" {
  source = "./instance/"

  #Set Palamater
  project-name        = "${var.project-name}"
  vpc-id              = "${module.aws_vpc.vpc-id}"
  public-subnets-ids  = "${module.aws_vpc.public-subnets-ids}"
  private-subnets-ids = "${module.aws_vpc.private-subnets-ids}"
  az                  = "${var.az}"
  sg-for_webserver-id = "${module.aws_vpc.sg-for_webserver-id}"
  ec2-config          = "${var.ec2-config}"

}

module "aws_alb" {
  source = "./loadbalancer/"

  #Set Palamater
  project-name        = "${var.project-name}"
  webserver-ids       = "${module.aws_ec2.webserver-ids}"
  sg-for_alb-id       = "${module.aws_vpc.sg-for_alb-id}"
  public-subnets-ids  = "${module.aws_vpc.public-subnets-ids}"
  vpc-id              = "${module.aws_vpc.vpc-id}"

  
}

module "aws_rds" {
  source = "./database/"

  #Set Palamater
  project-name        = "${var.project-name}"
  vpc-id              = "${module.aws_vpc.vpc-id}"
  private-subnets-ids = "${module.aws_vpc.private-subnets-ids}"
  az                  = "${var.az}"
  sg-for_rds-id       = "${module.aws_vpc.sg-for_rds-id}"
  rds-config          = "${var.rds-config}"


  
}

module "aws_s3" {
  source = "./storage/"

  #Set Palamater
  project-name            = "${var.project-name}"
  vpc-id                  = "${module.aws_vpc.vpc-id}"
  public-route-table-id   = "${module.aws_vpc.public-route-table-id}"
  s3-config               = "${var.s3-config}" 
}
