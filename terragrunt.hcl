terraform {
    source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"

    // When you run plan, apply and refresh, please apply the var_files
    
    extra_arguments "custom_vars" {
        commands = [
            "plan", 
            "apply", 
            "refresh",
            "destroy"
        ]
        required_var_files = ["${get_parent_terragrunt_dir()}/common.tfvars"]
    }
}

// Generate the provider. 

generate "provider" {

    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents =<<EOF
    provider "aws" {
        region = "eu-west-2"
    }
    EOF
}

/*
inputs = {
 
}
*/
