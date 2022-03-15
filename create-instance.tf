#Attach role to an instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "instance-profile"
  role = "CloudWatchAgentAdminRole"
}


# create-instance.tf

resource "aws_instance" "instance_1" {
  #count                       = var.instance_count
  ami = var.instance_ami_host
  #availability_zone = data.aws_ec2_instance_type_offerings.offer.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = var.ip_bridge_host
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = var.key_pair

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    "Owner"               = var.owner
    "Name"                = "Bridge-Host-${var.owner}" #${count.index}"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "instance_2" {
  #count                       = var.instance_count
  ami = var.instance_ami_join
  #availability_zone = data.aws_ec2_instance_type_offerings.offer.id
  availability_zone           = data.aws_availability_zones.available.names[1]
  instance_type               = var.instance_type_1
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet1.id
  private_ip                  = var.ip_bridge_join
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = var.key_pair

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    "Owner"               = var.owner
    "Name"                = "Bridge-Join-${var.owner}" #${count.index}"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "instance_3" {
  #count                       = var.instance_count
  ami = var.instance_ami_source
  #availability_zone = data.aws_ec2_instance_type_offerings.offer.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type_source
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = var.ip_source
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = var.key_pair

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    "Owner"               = var.owner
    "Name"                = "Source-Input-${var.owner}" #${count.index}"
    "Purpose"             = "Input-Source"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "instance_4" {
  #count                       = var.instance_count
  ami = var.instance_ami_analyze
  #availability_zone = data.aws_ec2_instance_type_offerings.offer.id
  availability_zone           = data.aws_availability_zones.available.names[1]
  instance_type               = var.instance_type_analyze
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet1.id
  private_ip                  = var.ip_analyze
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = var.key_pair

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    "Owner"               = var.owner
    "Name"                = "Analyze-NDI-${var.owner}" #${count.index}"
    "Purpose"             = "Analyze"
    "KeepInstanceRunning" = "false"
  }
}