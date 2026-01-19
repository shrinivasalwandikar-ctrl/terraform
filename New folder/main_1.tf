# resource "aws_instance" "test_ec2" {
#     ami = "ami-02b8269d5e85954ef"
#     instance_type = "t2.micro"
#     # count=1
#     key_name   = "VinKey"
#     tags = {
#         Name = "Test-EC2-Instance_1"
#     }
#   depends_on = [ aws_instance.test_ec2_2 ]
#  }

# resource "aws_instance" "test_ec2_2" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     key_name   = var.pem_key
#     tags = {
#         Name= "Test-EC2-Instance_2"
#     }
  
# }

# resource "aws_instance" "test_ec2" {
#     ami = "ami-02b8269d5e85954ef"
#     instance_type = "t2.micro"
#     # count=1
#     key_name   = "VinKey"
#     tags = {
#         Name = "Test-EC2-Instance_1"
#     }
#     depends_on = [ aws_instance.test_ec2_2 ]
#  # depends_on = [ aws_instance.test_ec2_2, aws_instance.test_ec2_3 ] #Explicit Dependency
#  }


resource "tls_private_key" "terra_pvt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
  
}


resource "aws_key_pair" "terra_pbc_key" {
    key_name   = "terra_pem"
    public_key = tls_private_key.terra_pvt_key.public_key_openssh #implicit dependency
    }


resource "local_file" "pem_key" {
    content  = tls_private_key.terra_pvt_key.private_key_pem
    filename = var.pem_file_name
    file_permission = "0400"
  
}
    

locals {
  
  ami="ami-02b8269d5e85954ef"
}


# resource "aws_instance" "test_ec2_2" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     key_name   = aws_key_pair.terra_pbc_key.key_name
#     tags = {
#         Name= "Test-EC2-Instance_2"
#     }
  
# }


resource "aws_instance" "test_ec2_2" {
    ami = local.ami
    instance_type = var.instance_type
    key_name   = aws_key_pair.terra_pbc_key.key_name
    tags = {
        Name= "Test-EC2-Instance_2"
    }
  
}

resource "local_file" "ansible_inventory" {
    content= aws_instance.test_ec2_2.public_ip
    filename= "ip_list.txt"
    file_permission = "0700"
  
}

# resource "aws_instance" "test_ec2_3" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     key_name   = var.pem_key
#     tags = {
#         Name= "Test-EC2-Instance_3"
#     }
  
# }



  
