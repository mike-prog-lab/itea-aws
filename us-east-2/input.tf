variable "student7" {
  type = object({
    arn = string
  })
  description = "Object presentation of student7 entity."
}

variable "ec2_ami" {
  type = string
  default = "ami-0f19d220602031aed"
}

variable "ec2_type" {
  type = string
  default = "t2.micro"
}