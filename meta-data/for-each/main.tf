resource "aws_instance" "my_instance" {
    for_each = {
      "frontend" ="t2.micro"
        "backend"  ="t2.micro"
        }
      
    ami=var.ami_id
    instance_type=each.value
    
    key_name=var.key_name
    tags = {
        Name = each.key
    }
lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
  }



  provider = aws.ap-south
}



