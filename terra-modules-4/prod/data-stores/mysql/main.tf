provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example_prod" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database_prod"
  username          = "admin"

  password = var.db_password
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "kevin-newk-terraform-state"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
