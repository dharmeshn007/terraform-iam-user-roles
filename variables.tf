variable "environment" {
  description = "The name of the environment (e.g. dev, prod)"
}

variable "username" {
  type = list(string)
  default = ["tucker","annie","josh"]
}

variable "region" {
  default = ""
}