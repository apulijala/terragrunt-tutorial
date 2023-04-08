variable "region_name" {
  description = "Deployment Region"
  default     = "eu-west-2"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC Network CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "environment" {
  description = "Enviornment nae for deployment"
  type        = string
  default     = "development"
}

variable "public_subnets" {
  description = "Provider public subnets CIDR Values"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.2.0/24"]
}

variable "private_subnets" {
  description = "Provider Private Subnets CIDR values"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24"]
}


variable "public_az" {
  description = "AZ names for public subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]

}

variable "private_az" {
  description = "AZ names for private subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]

}

