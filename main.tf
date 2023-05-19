provider "aws" {
  access_key = "AKIA4N4SN7PZ7JBUXMXC"
  secret_key = "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"
  region     = var.aws_region
  insecure   = true

  default_tags {
    tags = {
      Environment = var.environment
      Createby    = var.create_by_name
    }
  }
}
