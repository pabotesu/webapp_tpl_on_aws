/*-----------------------------vpc settings--------------------------------*/
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.project-name}-VPC"
  }
}
 resource "aws_internet_gateway" "internet-gateway" {
   vpc_id = aws_vpc.vpc.id
   tags = {
     Name = "${var.project-name}-IGW"
   }
}
/*--------------------------------------end------------------------------------------*/
/*-----------------------------public subnet settings--------------------------------*/
resource "aws_subnet" "public-subnet" {
    count             = length(var.public-subnets)
    vpc_id            = aws_vpc.vpc.id 
    cidr_block        = var.public-subnets[count.index]
    availability_zone = element(var.az, count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project-name}-public-${element(var.az, count.index)}"
    } 
}

resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }
    tags = {
        Name = "${var.project-name}-public-route-table"
    } 
}

resource "aws_route_table_association" "public-route-table" {
     count = length(var.public-subnets)
     subnet_id = element(aws_subnet.public-subnet.*.id, count.index)
     route_table_id = aws_route_table.public-route-table.id
     
}


/*--------------------------------------end------------------------------------------*/
/*-----------------------------private subnet settings--------------------------------*/
resource "aws_subnet" "private-subnet" {
    count             = length(var.private-subnets)
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.private-subnets[count.index]
    availability_zone = element(var.az, count.index)

    tags = {
        Name = "${var.project-name}-private-${element(var.az, count.index)}"
    }
} 



/*--------------------------------------end------------------------------------------*/

