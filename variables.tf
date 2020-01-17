## Target Group
variable "name" {
  description = "The name of the target group."
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets."
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group."
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  default     = 300
  type        = number
}

variable "health_check" {
  description = "A Health Check block."
  type        = any
}

## Tags

variable "tags" {
  description = "Resources Tags"
  type        = map(string)
}

