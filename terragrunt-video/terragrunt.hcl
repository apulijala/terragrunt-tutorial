terraform {

    source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
    extra_arguments "custom_vars" {
        commands = [
            "plan", 
            "apply", 
            "destroy"
        ]
        required_var_files = [
            "${get_parent_terragrunt_dir()}/common.tfvars"
        ]
    }
}

generate "my_provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents =<<EOF
    provider "aws" {
        region = "eu-west-2"
    }
    EOF
}

