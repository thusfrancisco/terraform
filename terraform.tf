terraform {
    required_version = ">= 1.0.0, < 1.1.0"
    required_providers = {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0.0"  # Allows only the rightmost version component to increment
        }
    }
}