
## this configuration will create an EKS cluster ##


### initialize

    terraform init

### preview terraform actions

    terraform plan

### apply configuration with variables

    terraform apply -var-file terraform-dev.tfvars

### destroy a single resource

    terraform destroy -target aws_vpc.myapp-vpc

### destroy everything fromtf files

    terraform destroy

### show resources and components from current state

    terraform state list

### show current state of a specific resource/data

    terraform state show aws_vpc.myapp-vpc    

### set avail_zone as custom tf environment variable - before apply

    export TF_VAR_avail_zone="eu-west-3a"

### for debuggin in TF
    
    export TF_LOG=TRACE    

###  connect to cluster
  
pre-Requisits = AWS CLi installed, kubectl installed and AWS-iam-authenticator installed

    aws eks update-kubeconfig --name myapp-eks-cluster --region us-east-1
    aws eks update-kubeconfig --name [name of EKS cluster] --region [region for aws config] 
