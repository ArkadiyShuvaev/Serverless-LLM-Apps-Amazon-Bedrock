provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      "CreatedBy" = "Terraform"
      "Project"    = "serverless-llm-apps-amazon-bedrock"
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["bedrock.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "serverless-llm-apps-bedrock-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy" "role_policy" {
  name   = "serverless-llm-apps-bedrock_policy"
  role   = aws_iam_role.role.id
  policy = file("${path.module}/aws_policy.json")
}
