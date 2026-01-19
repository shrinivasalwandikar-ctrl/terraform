
# output "public_ip" {
#     value = aws_instance.test_ec2.public_ip

# }


# output "private_ip" {
#     value = aws_instance.test_ec2_2.private_ip

# }

output "public_ips" {
  value = [
    #aws_instance.test_ec2.public_ip,
    aws_instance.test_ec2_2.public_ip
    
  ]
}

output "private_ips" {
  value = [
    #aws_instance.test_ec2.private_ip,
    aws_instance.test_ec2_2.private_ip

    
  ]
}

output "subnet_id"{
  value= [
#aws_instance.test_ec2.subnet_id,
aws_instance.test_ec2_2.subnet_id,

]
}

output "private_pem_key" {
  value     = tls_private_key.terra_pvt_key.private_key_pem
  sensitive = true
}


# output "private_pem_key" {
#   value     = tls_private_key.example.private_key_pem
#   sensitive = true
# }


# output "terraform_version" {
#   value = terraform.version
# }
