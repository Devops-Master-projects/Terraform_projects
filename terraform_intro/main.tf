provider "aws" {
    region = "us-east-1"
}



resource "random_integer" "num" {
    max = 100
    min = 1  
}

resource "random_pet" "pet_name" {
    prefix = "bootcamp30"
    length = 3
}
resource "aws_s3_bucket" "backend" {
    count = var.create_vpc ? 1 : 0 # [tinary operator] = will create 1 bucket if variable (create_vpc) is true [if false dont create hence 0]
    bucket = random_pet.pet_name.id 
#   bucket = "lower(bootcamp30-${random_integer.num}--$(var.name}" 
}
resource "aws_kms_key" "mykey" {
    deletion_window_in_days = 15
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend"{
    bucket = aws_s3_bucket.backend[0].id  # [0] is refrencing the number of bucket 

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = aws_kms_key.mykey.arn
      }
    }
}
     
variable "create_vpc" {
    type = bool
    default = true
  
}


