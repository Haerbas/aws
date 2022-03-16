# variables.tf

# Variables for general information
######################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

/*data "aws_availability_zones" "all" {}

data "aws_ec2_instance_type_offerings" "offer" {
  for_each = toset(data.aws_availability_zones.all.names)

  filter {
    name   = "instance-type"
    values = ["g4dn.xlarge", "g4dn.2xlarge"]
  }

  filter {
    name   = "location"
    values = [each.value]
  }

  location_type = "availability-zone"

  #preferred_instance_types = ["g4dn.xlarge","g4dn.2xlarge"]
}*/

variable "owner" {
  description = "Configuration owner"
  type        = string
  default     = "her"
}

data "aws_availability_zones" "available" {
  state = "available"
}

/*variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}*/


# Variables for VPC
######################################

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}


# Variables for internal IPs
######################################

variable "ip_source" {
  description = "Internal IP for Source Instance"
  type        = string
  default     = "10.0.1.10"
}

variable "ip_bridge_host" {
  description = "Internal IP for Bridge-Host Instance"
  type        = string
  default     = "10.0.1.20"
}

variable "ip_bridge_join" {
  description = "Internal IP for Bridge-Join Instance"
  type        = string
  default     = "10.0.2.10"
}

variable "ip_analyze" {
  description = "Internal IP for Analyze Instance"
  type        = string
  default     = "10.0.2.20"
}

# Variables for Security Group
######################################

variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule TCP"
  type        = string
  default     = "tcp"
}

variable "sg_ingress_proto_udp" {
  description = "Protocol used for the ingress rule UDP"
  type        = string
  default     = "udp"
}

variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule SSH"
  type        = string
  default     = "22"
}

variable "sg_ingress_nicedcv" {
  description = "Port used for the ingress rule NICE DCV"
  type        = string
  default     = "8443"
}

variable "sg_ingress_ndibridge" {
  description = "Port used for the ingress rule NDI Bridge"
  type        = string
  default     = "5990"
}

variable "sg_ingress_windowsrpd" {
  description = "Port used for the ingress rule RDP"
  type        = string
  default     = "3389"
}

variable "sg_ingress_vectarplus" {
  description = "Port used for the ingress rule Vectar Plus"
  type        = string
  default     = "5958"
}

variable "sg_ingress_http" {
  description = "Port used for the ingress rule http"
  type        = string
  default     = "80"
}

variable "sg_ingress_srt_from" {
  description = "Port used for the ingress rule SRT"
  type        = string
  default     = "9000"
}

variable "sg_ingress_srt_to" {
  description = "Port used for the ingress rule SRT"
  type        = string
  default     = "9100"
}

variable "sg_ingress_ephemeral_from" {
  description = "Port used for Ephemeral Ports"
  type        = string
  default     = "5000"
}

variable "sg_ingress_ephemeral_to" {
  description = "Port used for Ephemeral Ports"
  type        = string
  default     = "65535"
}
variable "sg_ingress_proto_all" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}

variable "sg_ingress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}
variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}

variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}

variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}


# Variables for Subnet
######################################

variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}

variable "sbn_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "sbn_cidr_block1" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Variables for Route Table
######################################

variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}


# Variables for Instance
######################################

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0855c56d5a1df2ef1" #viz-ndibridge
}

variable "instance_ami_host" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-07f00d5b61d8dd919" #vizrt-bridgehost
}

variable "instance_ami_join" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-05c43f79910b8af99" #vizrt-bridgejoin
}

variable "instance_ami_source" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0d943b15aeaa62fe7" #vizrt-source
}

variable "instance_ami_analyze" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0f593716612d7292c" #vizrt-analyze
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  #default     = "t2.micro"
  default = "g4dn.xlarge"
}

variable "instance_type_1" {
  description = "Type of the instance"
  type        = string
  #default     = "t2.micro"
  default = "g4dn.xlarge"
}

variable "instance_type_source" {
  description = "Type of the instance"
  type        = string
  #default     = "t2.micro"
  default = "m4.xlarge"
}

variable "instance_type_analyze" {
  description = "Type of the instance"
  type        = string
  #default     = "t2.micro"
  default = "m4.large"
}

/*variable "instance_count" {
  description = "How many instances should be deployed"
  type        = number
  default     = 1
}*/

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "vizrt-key-pair"
}

variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}

variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "100"
}