variable "domain_name" {
  description = "Hosted Zone Domain Name"
  type        = string
  default     = "makeitshort.link"
}

variable "environment" {
  description = "Environment (e.g. Preview / Prod)"
  type        = string
  default     = ""
}