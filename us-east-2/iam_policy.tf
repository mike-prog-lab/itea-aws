resource "aws_iam_policy" "s3_access" {
  name = "S3StaticStudent7Access"
  description = "Grant full access to student7 s3 static files bucket."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = "${aws_s3_bucket.static.arn}/*"
      }
    ]
  })
}