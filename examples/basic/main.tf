module "naming" {
  source = "../../"

  prefix        = "acme"
  environment   = "prod"
  region        = "us-ashburn-1"
  unique        = true
  unique_length = 5
}

output "bucket_name" {
  value = module.naming.objectstorage_bucket
}

output "policy_name" {
  value = module.naming.iam_policy
}
