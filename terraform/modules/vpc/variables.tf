variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
    description = "List of private subnet CIDR blocks"
    type        = list(string)
    default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "List of availability zones for the subnets"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "common_tags" {
  default = {
    Project     = "devops-project"
    Environment = "dev"
    Owner       = "sid"
    ManagedBy   = "terraform"
    Application  = "web-app"
    CostCenter  = "engineering"
  }
}