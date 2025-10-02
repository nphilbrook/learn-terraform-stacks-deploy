# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

upstream_input "aws_packer_compute" {
  type   = "stack"
  source = "app.terraform.io/philbrook/aws-packer-compute/aws-asgard-packer-compute"
}

deployment "development" {
  inputs = {
    regions          = ["us-east-1"]
    role_arn         = "arn:aws:iam::590184029125:role/tfc-philbrook-role"
    identity_token   = identity_token.aws.jwt
    default_tags     = { stacks-preview-example = "lambda-component-expansion-stack" }
    public_dns_names = upstream_input.aws_packer_compute.dev_packer_public_dns[0]
  }
}

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
