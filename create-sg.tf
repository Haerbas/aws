# create-sg.tf

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg" {
  name        = "sg_vizrt"
  description = "Allow inbound traffic via SSH"
  vpc_id      = aws_vpc.vpc.id

  ingress = [{
    description      = "All-Traffic"
    protocol         = var.sg_ingress_proto_all
    from_port        = var.sg_ingress_all
    to_port          = var.sg_ingress_all
    cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    },
    {
      description      = "SSH-Income"
      protocol         = var.sg_ingress_proto
      from_port        = var.sg_ingress_ssh
      to_port          = var.sg_ingress_ssh
      cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Win-RDP"
      protocol         = var.sg_ingress_proto
      from_port        = var.sg_ingress_windowsrpd
      to_port          = var.sg_ingress_windowsrpd
      cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "HTTP"
      protocol         = var.sg_ingress_proto
      from_port        = var.sg_ingress_http
      to_port          = var.sg_ingress_http
      cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Ephemeral-UDP"
      protocol         = var.sg_ingress_proto_udp
      from_port        = var.sg_ingress_ephemeral_from
      to_port          = var.sg_ingress_ephemeral_to
      cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Ephemeral-TCP"
      protocol         = var.sg_ingress_proto
      from_port        = var.sg_ingress_ephemeral_from
      to_port          = var.sg_ingress_ephemeral_to
      cidr_blocks      = ["0.0.0.0/0"] #["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false

  }]

  tags = {
    "Owner" = var.owner
    "Name"  = "sg-${var.owner}"
  }
}