variable "bucket_name" {
  default = "my-bucket-test-cicd-26899"
}

variable "subnets" {
  type = map(object({
    cidr = string
    az = string
    public = bool
  }))
  default = {
    "public-1" = {
      cidr = "10.0.1.0/24"
      az = "ap-south-1a"
      public = true
    }
    "public-2" = {
      cidr = "10.0.2.0/24"
      az = "ap-south-1b"
      public = true
    }
    "private-1" = {
      cidr = "10.0.11.0/24"
      az = "ap-south-1a"
      public = false
    }
    "private-2" = {
      cidr = "10.0.12.0/24"
      az = "ap-south-1b"
      public = false
    }
  }
}