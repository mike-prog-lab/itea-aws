resource "aws_key_pair" "student7" {
  key_name   = "student7-kp"
  public_key = var.student7.pk
}