
variable "instance_type" {
    description = "Type of instance to use"
    type        = string
    default     = "t2.micro"
     
}

variable "pem_key" {
    description = "Type of instance to use"
    type        = string
    default     = "VinKey"
     
}


variable "ami_id" {
    description = "Type of instance to use"
    type        = string
    default     = "ami-0ced6a024bb18ff2e"
     
}

variable "pem_file_name" {
    description = "Type of instance to use"
    type        = string
    default     = "terra_pem.pem"
     
}
