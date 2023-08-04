# HCL Syntax

```ps1
# Template
<BLOCK_TYPE> "<BLOCK_LABEL>" "<BLOCK_LABEL>" {
    # Block body
    <IDENTIFIER> = <EXPRESSION> # Argument
}

# AWS EC2 Example
resource "aws_instance" "web_server" {  # BLOCK
    ami = "ami-04d29b6f966df1537"  # Argument
    instance_type = var.instance_type  # Argument with value as expression
}
```


# CLI

## Save a Terraform plan to be executed later

```sh
terraform plan -out myplan
terraform apply "myplan"
```

## Create a Terraform plan for terraform destroy

```sh
terraform plan -destroy
```

# Terraform Configuration

Terraform can be configured by creating a `terraform.tf` file. Running `terraform init` will setup the Terraform environment as configured.

# Terraform State and Backend

It is very important to select a Terraform backend that supports locking - locks prevent state to be altered while it is being accessed.


