output "objectstorage_bucket" {
  description = "Object Storage bucket name (<base>-os-bkt[-suffix])"
  value = substr(
    "${local.base}-os-bkt${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "objectstorage_private_endpoint" {
  description = "Object Storage private endpoint name (<base>-os-pe[-suffix])"
  value = substr(
    "${local.base}-os-pe${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "iam_policy" {
  description = "IAM policy name (<base>-iam-pol[-suffix])"
  value = substr(
    "${local.base}-iam-pol${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}
output "identity_user" {
  description = "Identity user name (<base>-identity-user[-suffix])"
  value = substr(
    "${local.base}-identity-user${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "identity_group" {
  description = "Identity group name (<base>-identity-group[-suffix])"
  value = substr(
    "${local.base}-identity-group${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "objectstorage_replication_policy" {
  description = "Object Storage replication policy name (<base>-os-repl[-suffix])"
  value = substr(
    "${local.base}-os-repl${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "objectstorage_lifecycle_policy" {
  description = "Object Storage lifecycle policy name (<base>-os-lc[-suffix])"
  value = substr(
    "${local.base}-os-lc${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "vcn" {
  description = "VCN name (<base>-vcn[-suffix])"
  value = substr(
    "${local.base}-vcn${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "subnet" {
  description = "Subnet name (<base>-snet[-suffix])"
  value = substr(
    "${local.base}-snet${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "nsg" {
  description = "Network security group name (<base>-nsg[-suffix])"
  value = substr(
    "${local.base}-nsg${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "oke" {
  description = "OKE cluster name (<base>-oke[-suffix])"
  value = substr(
    "${local.base}-oke${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}
output "file_storage_mount_target" {
  description = "File Storage mount target name (<base>-fss-mt[-suffix])"
  value = substr(
    "${local.base}-fss-mt${local.unique_suffix != "" ? "-${local.unique_suffix}" : ""}",
    0,
    100
  )
}

output "vault_secret" {
  description = "Vault secret name (<base>-secret-<suffix>; ends in a hyphen when unique is false)"
  value = substr(
    "${local.base}-secret-${local.unique_suffix != "" ? local.unique_suffix : ""}",
    0,
    100
  )
}
