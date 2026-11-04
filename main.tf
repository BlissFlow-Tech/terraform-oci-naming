resource "random_id" "suffix" {
  keepers = {
    prefix      = var.prefix
    environment = var.environment
    region      = var.region
  }

  byte_length = ceil(var.unique_length / 2)
}
