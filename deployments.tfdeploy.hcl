# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

# deployment "development" {
#   inputs = {
#     regions        = ["us-east-1"]
#     role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
#     identity_token = identity_token.aws.jwt
#     default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
#   }
# }

# deployment "production" {
#   inputs = {
#     regions        = ["us-east-1", "us-west-1"]
#     role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
#     identity_token = identity_token.aws.jwt
#     default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
#   }
# }

# deployment "test" {
#   inputs = {
#     regions        = ["us-east-1", "us-west-1"]
#     role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
#     identity_token = identity_token.aws.jwt
#     default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
#   }
# }


upstream_input "aws_packer_compute" {
  type   = "stack"
  source = "app.terraform.io/philbrook/aws-packer-compute/aws-packer-compute"
}

publish_output "dev_packer_instance_profile_role_arn" {
  value = upstream_input.aws_packer_compute.dev_packer_instance_profile_role_arn
}

publish_output "dev_packer_public_dns" {
  value = upstream_input.aws_packer_compute.dev_packer_public_dns
}

publish_output "prod_packer_instance_profile_role_arn" {
  value = upstream_input.aws_packer_compute.prod_packer_instance_profile_role_arn
}

publish_output "prod_packer_public_dns" {
  value = upstream_input.aws_packer_compute.prod_packer_public_dns
}
