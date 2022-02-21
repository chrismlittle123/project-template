data "aws_iam_policy_document" "project_template_assume_role_lambda" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "project_template_lambda_access_policy" {

  statement {
    effect    = "Allow"
    actions   = ["events:Put*"]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging",
      "s3:DeleteObject"
    ]
    resources = [
      "*"
    ]
  }
}
