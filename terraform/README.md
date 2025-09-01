### terraform commands 

```
terraform init
terraform plan
terraform apply
OR ==
terraform apply  --auto-approve
terraform destroy
```

## to setup aws access & secret key in your terraform machine 

```
aws  configure
AWS Access Key ID [****************JVFG]: 
AWS Secret Access Key [****************uBbE]: 
Default region name [ap-southeast-2]: 
Default output format [None]: 

```

## how to check current state of terraform 

```
 humanfirmware@darwin  ~/Devops_targetJuly2025/terraform/aws/ec2   master ±  terraform state list
aws_instance.example
 humanfirmware@darwin  ~/Devops_targetJuly2025/terraform/aws/ec2   master ±  


```
## take code of HCL from given link /website

[click](https://registry.terraform.io/)