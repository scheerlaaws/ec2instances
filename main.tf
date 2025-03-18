provider "aws" {
  region = "us-east-1"
}

variable "instances" {
  description = "List of instances with their configurations"
  type = list(object({
    instance_type = string
    volume_type   = string
    volume_size   = number
    key_name      = string
    iops          = number
  }))
}

resource "aws_instance" "ec2_instances" {
  count         = length(var.instances)
  ami           = "ami-0024699f66c5b8fd7" 
  instance_type = var.instances[count.index].instance_type
  key_name      = var.instances[count.index].key_name

  root_block_device {
    volume_type = var.instances[count.index].volume_type
    volume_size = var.instances[count.index].volume_size
    iops        = var.instances[count.index].iops
  }

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}
