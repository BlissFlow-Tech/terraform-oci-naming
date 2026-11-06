# terraform-oci-naming

Terraform module that builds consistent OCI resource names from a prefix, an environment, a region short code and an optional stable random suffix.

## Usage

```hcl
module "naming" {
  source  = "blissflow-tech/naming/oci"
  version = "~> 1.0"

  prefix      = "acme"
  environment = "prod"
  region      = "us-ashburn-1"
}

resource "oci_objectstorage_bucket" "logs" {
  name           = module.naming.objectstorage_bucket
  compartment_id = var.compartment_id
  namespace      = var.namespace
}
```

Names have the shape `<prefix>-<environment>-<region-short>-<kind>[-<suffix>]`, for example `acme-prod-iad-vcn-1a2b`.

## Notes

* The suffix comes from a `random_id` that only changes when `prefix`, `environment` or `region` change, so names stay stable across applies.
* Every name is truncated to 100 characters.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.3 |
| random | >= 3.0, < 4.0 |

## Providers

| Name | Version |
| ---- | ------- |
| random | >= 3.0, < 4.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| environment | Deployment environment (dev, qa, prod, etc.) | `string` | n/a | yes |
| prefix | Business or application prefix (e.g. app, platform) | `string` | n/a | yes |
| region | OCI region (e.g. us-ashburn-1). Known regions map to their three-letter airport code; others use the first three characters. | `string` | n/a | yes |
| unique | Whether to append a random hex suffix that stays stable while prefix, environment and region stay the same | `bool` | `true` | no |
| unique\_length | Length of the generated unique suffix | `number` | `4` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| file\_storage\_mount\_target | File Storage mount target name (<base>-fss-mt[-suffix]) |
| iam\_policy | IAM policy name (<base>-iam-pol[-suffix]) |
| identity\_group | Identity group name (<base>-identity-group[-suffix]) |
| identity\_user | Identity user name (<base>-identity-user[-suffix]) |
| nsg | Network security group name (<base>-nsg[-suffix]) |
| objectstorage\_bucket | Object Storage bucket name (<base>-os-bkt[-suffix]) |
| objectstorage\_lifecycle\_policy | Object Storage lifecycle policy name (<base>-os-lc[-suffix]) |
| objectstorage\_private\_endpoint | Object Storage private endpoint name (<base>-os-pe[-suffix]) |
| objectstorage\_replication\_policy | Object Storage replication policy name (<base>-os-repl[-suffix]) |
| oke | OKE cluster name (<base>-oke[-suffix]) |
| subnet | Subnet name (<base>-snet[-suffix]) |
| vault\_secret | Vault secret name (<base>-secret[-suffix]) |
| vcn | VCN name (<base>-vcn[-suffix]) |
<!-- END_TF_DOCS -->

## License

Apache 2.0. See [LICENSE](LICENSE).
