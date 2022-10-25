variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-west-3"
}
variable "ami" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {
  type = list
}
variable "identity" {}
