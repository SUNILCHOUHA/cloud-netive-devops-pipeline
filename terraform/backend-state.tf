terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }


  backend "s3" {
    bucket         = "backend-eks-state-cicd"
    key            = "terraform/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
    # dynamodb_table = "State-lock"
    encrypt        = true
  }
}
