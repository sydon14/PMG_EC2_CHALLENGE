variable "vpc_cidr" {
  default = "10.252.0.0/16"
}

variable "instance_type" {
    default = "t2.micro"

}

variable "region" {
  description = "my region value"
  type        = string
  default     = ""

}

variable "key" {
  description = "user key"
  type        = string
  default     = ""
}

variable "sec_key" {
  description = "user secret key"
  type        = string
  default     = ""
}