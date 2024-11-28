variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t2.micro"
  default = "t2.micro"
}
variable "region" {
  type = string
  default = "ap-southeast-1"
}
variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0f935a2ecd3a7bd5c"
    "ap-northeast-1" : "ami-023ff3d4ab11b2525"
  }
}