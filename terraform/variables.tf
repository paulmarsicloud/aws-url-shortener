variable "domain_name" {
  description = "Hosted Zone Domain Name"
  type        = string
  default     = "meeple.pro"
}

variable "environment" {
  description = "Environment (e.g. Preview / Prod)"
  type        = string
  default     = ""
}