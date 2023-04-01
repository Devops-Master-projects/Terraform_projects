module "s3" {
    source = "../S3"
    region = var.aws_region
    create_vpc = var.create-vpc
  
}

variable "aws_region" {
    type = string
  
}

variable "create-vpc" {
    type = bool
  
}