variable "private_subnets" {} 
variable "target_group_arn" {}
variable "ec2_sg_id" {}
variable "ami_id" {}

variable "iam_instance_profile_name" {
    description = "IAM Instance profile name"
    type = string
}
