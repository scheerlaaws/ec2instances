instances = [
  {
    instance_type = "t2.micro"
    volume_type   = "gp2"
    volume_size   = 35
    key_name      = "key1"
    iops          = 0 # No IOPS required for gp2
  },
  {
    instance_type = "t3.small"
    volume_type   = "gp2"
    volume_size   = 35
    key_name      = "key2"
    iops          = 0 # No IOPS required for gp2
  },
  {
    instance_type = "m5.large"
    volume_type   = "io1"
    volume_size   = 35
    key_name      = "key3"
    iops          = 1750 # Set a valid IOPS value (e.g., 50:1 ratio for io1)
  },
  {
    instance_type = "t3.medium"
    volume_type   = "gp3"
    volume_size   = 35
    key_name      = "key4"
    iops          = 0 # No IOPS required for gp3
  },
  {
    instance_type = "c5.xlarge"
    volume_type   = "io1"
    volume_size   = 35
    key_name      = "key5"
    iops          = 1500 # Set a valid IOPS value (e.g., 50:1 ratio for io1)
  }
]
