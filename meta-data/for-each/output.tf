output "instance1" {
    value = aws_instance.my_instance["frontend"].id
  
}
output "instance2" {
    value = aws_instance.my_instance["backend"].id
  
}