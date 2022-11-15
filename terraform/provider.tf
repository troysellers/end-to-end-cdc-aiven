terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">= 3.1"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}

provider "aiven" {
  api_token = var.aiven_api_token
}