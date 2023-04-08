terraform {

    source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"

    extra_arguments "terraform_vars" {
    
            commands = [
                "apply",
                "plan",
                "destroy",
                "refresh"
            ]
    
            required_var_files = [
                    "${get_parent_terragrunt_dir()}/common.tfvars"
            ]

    }
    before_hook "before plan and apply" {
        
        commands = ["plan", "apply"]
        execute = ["echo", "Before Plan and Apply !!"]

    }

    after_hook "after plan and apply" {
        
        commands = ["plan", "apply"]
        execute = ["echo", "After Plan and Apply !!"]

    }
}


generate "provider" {

    path = "provider.tf"
    if_exists = "overwrite"
    contents =<<EOF
        provider "aws" {
            region = "eu-west-2"
        }
    EOF

}

remote_state {

    backend = "s3"   
 
    generate = {
        path = "new-bucket.tf"
        if_exists = "overwrite"
    }
 
    config = {
        bucket = "state-datta-files"
        key = "${path_relative_to_include()}/vpc.tf.state"
        region = "eu-west-2"
        encrypt = true
        dynamodb_table = "terraform-state-locks"
    }

}