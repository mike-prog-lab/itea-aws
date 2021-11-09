module "iam_s3_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    var.student7.arn,
  ]

  create_role = true

  role_name = "S3Student7ManagerRole"

  custom_role_policy_arns = [
    aws_iam_policy.s3_access.arn,
  ]
}