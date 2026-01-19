terraform {
    required_version = ">= 1.5.0"
    required_providers {
      aws=">= 4.0.0, < 7.0.0"
      tls=">= 3.0.0"
      local=">= 2.0.0"
    }
backend "s3" {
  bucket = "shrini-backend-bucket-versioned-sse-bucket"
  key="main/terraform.tfstate"
  region = "ap-south-1"
  encrypt = true
  use_lockfile = true
}
    }
  

    