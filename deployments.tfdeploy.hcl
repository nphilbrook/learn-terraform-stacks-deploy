# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "test" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = "arn:aws:iam::590184029125:role/tf-philbrook-example-app-2"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

publish_output "dev_lambda_url" {
  description = "URLs to invoke lambda functions"
  value = deployment.development.lambda_urls[0]
}
