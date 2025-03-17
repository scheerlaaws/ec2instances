variable "instances" {
  description = "List of instances with their configurations"
  type = list(object({
    instance_type = string
    volume_type   = string
    volume_size   = number
    key_name      = string
  }))
}
