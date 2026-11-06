locals {
  label_order     = length(try(var.context.label_order, [])) > 0 ? var.context.label_order : ["namespace", "tenant", "environment", "stage", "name", "attributes"]
  id_length_limit = try(var.context.id_length_limit, null) != null ? var.context.id_length_limit : 100
  labels_as_tags  = contains(try(tolist(var.context.labels_as_tags), ["unset"]), "unset") ? ["namespace", "tenant", "environment", "stage"] : var.context.labels_as_tags

  region_key = one([
    for s in data.oci_identity_region_subscriptions.this.region_subscriptions : lower(s.region_key)
    if s.region_name == var.region && s.state == "READY"
  ])
}

data "oci_identity_region_subscriptions" "this" {
  tenancy_id = var.tenancy_id
}

module "this" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context         = var.context
  label_order     = local.label_order
  id_length_limit = local.id_length_limit
  labels_as_tags  = local.labels_as_tags
}

module "label" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  for_each = var.names

  context = module.this.context
  name    = each.key
}
