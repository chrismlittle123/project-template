locals {
  service_name = "project-template"
  repo_name    = "project-template"
}
resource "aws_iam_role" "lambda_iam" {
  force_detach_policies = true
  name                  = "${var.project}-lambda-role"
  assume_role_policy    = data.aws_iam_policy_document.project_template_assume_role_lambda.json
  path                  = "/${var.project}/${local.service_name}/"
}

resource "aws_iam_policy" "inline_policy" {
  name   = "${var.project}-${local.service_name}-policy"
  policy = data.aws_iam_policy_document.project_template_lambda_access_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_iam_to_policy_attachment" {
  policy_arn = aws_iam_policy.inline_policy.arn
  role       = aws_iam_role.lambda_iam.name
}
