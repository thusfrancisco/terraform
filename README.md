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

## Terraform Refresh

The command `terraform refresh` checks if there have been any changes to the infrastructure's state, then updates the documented state. This command has since been _deprecated_.

Currently, the recommended way to refresh is throw the `plan` and `apply` commands, with the optional `-refresh-only` argument. This way, Terraform checks if the infrastructure has suffered any unforeseen changes, and updates the state (if `apply` is approved).

**`terraform apply -refresh-only` does not apply any changes to the infrastructure**, only Terraform's state.
Likewise, if the configuration files haven't been changed, running `terraform apply` would simply revert the unforeseen changes back to the current version of the Terraform code.


# Variables

The order of precedence for Terraform variables, from least precedence to highest precedence, is:
- ``variables.tf``
- Environment variables.
- ``terraform.tfvars``
- ``terraform.tfvars.json``
- ``*.auto.tfvars.*``
- Command line with the `-var` option.

The recommended way of setting Terraform variables is to use a ``terraform.tfvars`` file.