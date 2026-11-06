# terraform-oci-naming

Terraform module that builds OCI resource names from a [Cloud Posse null-label](https://github.com/cloudposse/terraform-null-label) context, so names follow the same `namespace`, `tenant`, `environment`, `stage` labels that Atmos stacks use.

## Usage

Copy [context.tf](https://github.com/cloudposse/terraform-null-label/blob/main/exports/context.tf) into the root module, set the labels as stack or tfvars inputs, and pass `module.this.context`:

```hcl
module "naming" {
  source  = "blissflow-tech/naming/oci"
  version = "~> 2.0"

  context    = module.this.context
  names      = ["logs", "app"]
  region     = "us-ashburn-1"
  tenancy_id = var.tenancy_id
}

resource "oci_objectstorage_bucket" "logs" {
  name           = module.naming.ids["logs"]
  compartment_id = var.compartment_id
  namespace      = var.object_storage_namespace
}
```

With `namespace = "acme"`, `environment = "iad"` and `stage = "prod"`, `ids["logs"]` is `acme-iad-prod-logs`.

## Notes

* Labels join in the order `namespace`, `tenant`, `environment`, `stage`, `name`, `attributes`, skipping empty ones. A context that sets its own `label_order` keeps it.
* `environment` is the region: it must be the lowercase key of `region` (`us-ashburn-1` is `iad`). The plan fails unless the region is subscribed in the tenancy and the key matches.
* IDs longer than 100 characters are truncated with a hash suffix. A context that sets `id_length_limit` keeps it.
* `tags` carries the `namespace`, `tenant`, `environment` and `stage` labels plus `Name`, within the OCI limit of 10 free-form tags.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.3 |
| oci | >= 8.0, < 10.0 |

## Providers

| Name | Version |
| ---- | ------- |
| oci | >= 8.0, < 10.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| label | cloudposse/label/null | 0.25.0 |
| this | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [oci_identity_region_subscriptions.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| region | OCI region identifier (e.g. us-ashburn-1). The context environment must be its region key in lowercase (e.g. iad) | `string` | n/a | yes |
| tenancy\_id | OCID of the tenancy, used to check that the region is subscribed | `string` | n/a | yes |
| context | Cloud Posse null-label context, usually module.this.context from a context.tf | `any` | <pre>{<br/>  "additional_tag_map": {},<br/>  "attributes": [],<br/>  "delimiter": null,<br/>  "descriptor_formats": {},<br/>  "enabled": true,<br/>  "environment": null,<br/>  "id_length_limit": null,<br/>  "label_key_case": null,<br/>  "label_order": [],<br/>  "label_value_case": null,<br/>  "labels_as_tags": [<br/>    "unset"<br/>  ],<br/>  "name": null,<br/>  "namespace": null,<br/>  "regex_replace_chars": null,<br/>  "stage": null,<br/>  "tags": {},<br/>  "tenant": null<br/>}</pre> | no |
| names | Names to build an ID for, each appended to the context as its name label | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| context | Context with the OCI defaults applied, to pass on as context |
| id | ID built from the context alone |
| id\_full | ID built from the context alone, before length truncation |
| ids | ID per entry in names |
| normalized\_context | Context with every value resolved |
| tags | Free-form tags from the context labels |
<!-- END_TF_DOCS -->

## License

Apache 2.0. See [LICENSE](LICENSE).
