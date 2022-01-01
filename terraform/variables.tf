variable "region" {
  description = "Region in which to build the resource."
  default     = "ap-northeast-1"
  type        = string
}

variable "domain" {
  description = "Domain to be used for construction."
  type        = string
}

variable "host_zone_id" {
  description = "ID of the host zone in which to insert the record."
  type        = string
}
