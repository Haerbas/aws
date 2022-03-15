#create-sbn.tf

/*output "subnet" {
  value = data.aws_availability_zones.available
}*/

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sbn_cidr_block
  map_public_ip_on_launch = var.sbn_public_ip
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    "Owner" = var.owner
    "Name"  = "sub1-${var.owner}"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sbn_cidr_block1
  map_public_ip_on_launch = var.sbn_public_ip
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    "Owner" = var.owner
    "Name"  = "sub2-${var.owner}"
  }
}