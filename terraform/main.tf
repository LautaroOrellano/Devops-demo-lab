terraform {
    required_version = ">= 1.5"
}

provider "local" {}

resource "local_file" "example" {
    filename = "terraform_output.txt"
    content = "Terraform working - DevOps Trainee Lab"
}