variable "vpc_cidr" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "private_subnet_cidr" {
    type = string
}

variable "public_subnet_cidr" {
    type = string
}

variable "aws_region" {
    type = string
}

variable "app_port" {
    type = number
    default = 2368
}

variable "rds_port" {
    type = number
    default = 3306
}