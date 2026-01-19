terraform {
    required_version = ">= 1.5.0"
    required_providers {
      aws=">= 4.0.0, < 7.0.0"
      tls=">= 3.0.0"
      local=">= 2.0.0"
    }
backend "local" {
  path = "C:/Users/DELL/Downloads/state_data/my.tfstate"
}
    }
  

    