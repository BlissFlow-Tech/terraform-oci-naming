output "id" {
  description = "ID built from the context alone"
  value       = module.this.id

  precondition {
    condition     = local.region_key == module.this.environment
    error_message = "environment must be the lowercase key of a subscribed region: ${var.region} is ${coalesce(local.region_key, "not subscribed")}, environment is ${coalesce(module.this.environment, "unset")}"
  }
}

output "ids" {
  description = "ID per entry in names"
  value       = { for k, v in module.label : k => v.id }

  precondition {
    condition     = length(setsubtract(keys(var.name_overrides), var.names)) == 0
    error_message = "name_overrides has keys missing from names: ${join(", ", setsubtract(keys(var.name_overrides), var.names))}"
  }

  precondition {
    condition     = local.region_key == module.this.environment
    error_message = "environment must be the lowercase key of a subscribed region: ${var.region} is ${coalesce(local.region_key, "not subscribed")}, environment is ${coalesce(module.this.environment, "unset")}"
  }
}

output "id_full" {
  description = "ID built from the context alone, before length truncation"
  value       = module.this.id_full
}

output "tags" {
  description = "Free-form tags from the context labels"
  value       = module.this.tags
}

output "context" {
  description = "Context with the OCI defaults applied, to pass on as context"
  value       = module.this.context
}

output "normalized_context" {
  description = "Context with every value resolved"
  value       = module.this.normalized_context
}
