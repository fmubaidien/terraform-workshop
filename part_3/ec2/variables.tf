variable "instance_type" {
    type = string
}

variable "ec2_subnet_id" {
    type = string
}

variable "ec2_sg_ids" {
    type = list(string)
}

variable "key_name" {
    type = string
}

variable "db_ip" {
  type = string
}

variable "db_username" {
    type = string
}

variable "db_password" {
    type = string
}

variable "db_name" {
    type = string
}