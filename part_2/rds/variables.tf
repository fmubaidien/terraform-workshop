variable "rds_subnet_ids" {
  type = list(string)
}

variable "rds_sg_ids" {
  type = list(string)
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

variable "db_identifier" {
    type = string
}