### *This will create s3 bucket backend with kms encryption*

##### pass tinary operator

```
count = var.create_vpc ? 1 : 0 # [tinary operator] = will create 1 bucket if variable (create_vpc) is true [if false dont create hence 0]
bucket = aws_s3_bucket.backend[0].id  # [0] is refrencing the number of bucket. if 5 buckets were created, then [0,1,2,3,4]
```

#### create main.tf variable.tf provider.tf

to make code clean, create sepetate files and organize

variable can also be named input

#### [added s3 module and initialize]()

* [ ] list all resources created - State file

```
 terraform list
```

move block - rename resource


===============================

## Terraform blocks: 9 top level blocks

### * Terraform setting block:

```yaml
terraform
{  required_version
= "~> 1.0"         1.1.4/5/6/71.2/3/4/5 1.1.4/5/6/7  required_providers
{    aws = {      source
 = "hashicorp/aws"      version
= "~> 3.0"  }}  backend
"s3" {    bucket =
"terraform-mylandmark"    key
   = "prod/terraform.tfstate"    region =
"us-west-2"    dynamodb_table
= "terraform-lock"}}
```

### * **Provider block: plugin /api**

```yaml
provider
"aws" {  #profile =
"default" # AWS Credentials Profile configured on your local desktop
terminal  $HOME/.aws/credentials  region  =
"us-west-2"}
```

#### * Resource block:

```yaml
  resource
"aws_instance" "bootcamp31" {     #ami
          = "ami-0e5b6b6a9f3db6db8" # Amazon
Linux     ami
= data.aws_ami.ubuntu.id     instance_type
= var.instance_type[1]     delete_on_termination
= true     tags
= {      Name
= local.name   }  }
```

**Variables block / inputs**

```yaml
variable
"instance_type" {  description =
"EC2 Instance Type"  type =
list(string)  default =
["t2.micro", "t2.medium"]}
```

**Output blocks:**

```yaml
output
"public_ip" {  description =
"ec2 instance public ip"  value =
aws_instance.inst1.arn}
```

**local value block**

```
locals {name =
"{var.app_name}-var.appname−{var.environment}"}  Jenkins-production
```

7. Data sources:

```
data
"aws_ami" "ubuntu" {most_recent
= trueowners
= ["self"]filter
{name
= "name"value
= ["packer-docker"]} }
```

#### * Modules block:

```
  module
"ec2" {    source =
"./my_instance"    version
= "1.0.1"    instance_type
= var.instance_type}
```

##### moved blocks

```
moved
{  from =
"aws_instance.bootcamp30 "  to =
"aws_instance.bootcamp31 "}
```
