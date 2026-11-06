module "this" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace   = "acme"
  environment = "iad"
  stage       = "prod"
}

module "naming" {
  source = "../../"

  context    = module.this.context
  names      = ["app", "logs"]
  region     = "us-ashburn-1"
  tenancy_id = var.tenancy_id
}

output "ids" {
  value = module.naming.ids
}
