provider "aws" {
  region = "eu-west-1" 
}

variable "instances" {
  description = "List of instances with their configurations"
  type = list(object({
    instance_type = string
    volume_type   = string
    volume_size   = number
    key_name      = string
  }))
}

resource "aws_instance" "ec2_instances" {
  count         = length(var.instances)
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID for your region
  instance_type = var.instances[count.index].instance_type
  key_name      = var.instances[count.index].key_name

  root_block_device {
    volume_type = var.instances[count.index].volume_type
    volume_size = var.instances[count.index].volume_size
  }

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}
