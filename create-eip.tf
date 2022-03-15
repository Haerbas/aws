#create new eip's

/*resource "aws_eip" "ip_1" {
  vpc = true
  tags = {
    "Purpose"             = "Bridge-Host"
   }
}

resource "aws_eip" "ip_2" {
  vpc = true
  tags = {
    "Purpose"             = "Bridge-Join"
   }
}

resource "aws_eip" "ip_3" {
  vpc = true
   tags = {
    "Purpose"             = "Input-Source"
   }
}

resource "aws_eip" "ip_4" {
  vpc = true
  tags = {
    "Purpose"             = "Analyze"
   }
}*/

#query for eip's
data "aws_eip" "host" {
  filter {
    name   = "tag:Name"
    values = ["Bridge-Host"]
  }
}

data "aws_eip" "join" {
  filter {
    name   = "tag:Name"
    values = ["Bridge-Join"]
  }
}

data "aws_eip" "source" {
  filter {
    name   = "tag:Name"
    values = ["Input-Source"]
  }
}

data "aws_eip" "analyze" {
  filter {
    name   = "tag:Name"
    values = ["Analyze"]
  }
}

#assign eip's to the instances

resource "aws_eip_association" "eip_assoc_1" {
  instance_id   = aws_instance.instance_1.id
  allocation_id = data.aws_eip.host.id
}

resource "aws_eip_association" "eip_assoc_2" {
  instance_id   = aws_instance.instance_2.id
  allocation_id = data.aws_eip.join.id
}

resource "aws_eip_association" "eip_assoc_3" {
  instance_id   = aws_instance.instance_3.id
  allocation_id = data.aws_eip.source.id
}

resource "aws_eip_association" "eip_assoc_4" {
  instance_id   = aws_instance.instance_4.id
  allocation_id = data.aws_eip.analyze.id
}