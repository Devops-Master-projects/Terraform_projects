### This will create s3 bucket baned with kms encryption

##### pass tinary operator
count = var.create_vpc ? 1 : 0 # [tinary operator] = will create 1 bucket if variable (create_vpc) is true [if false dont create hence 0]
bucket = aws_s3_bucket.backend[0].id  # [0] is refrencing the number of bucket. if 5 buckets were created, then [0,1,2,3,4]
