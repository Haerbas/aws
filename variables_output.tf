# variable_output.tf

# Variables to show after the deployment
#########################################

/*output "public_ip" {
  value = aws_instance.instance.*.public_ip
}*/

/*output "availability" {
  value = data.aws_ec2_instance_type_offerings.offer
  #value = { for az, details in data.aws_ec2_instance_type_offerings.offer : az => details.instance_type }
}*/