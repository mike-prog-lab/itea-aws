resource "aws_s3_bucket" "static" {
  bucket = "static-files-devops-student7"
  acl = "private"
}