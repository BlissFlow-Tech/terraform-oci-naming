variable "context" {
  description = "Cloud Posse null-label context, usually module.this.context from a context.tf"
  type        = any
  default = {
    enabled             = true
    namespace           = null
    tenant              = null
    environment         = null
    stage               = null
    name                = null
    delimiter           = null
    attributes          = []
    tags                = {}
    additional_tag_map  = {}
    regex_replace_chars = null
    label_order         = []
    id_length_limit     = null
    label_key_case      = null
    label_value_case    = null
    descriptor_formats  = {}
    labels_as_tags      = ["unset"]
  }
}

variable "names" {
  description = "Names to build an ID for, each appended to the context as its name label"
  type        = set(string)
  default     = []
}

variable "region" {
  description = "OCI region identifier (e.g. us-ashburn-1). The context environment must be its region key in lowercase (e.g. iad)"
  type        = string
}

variable "tenancy_id" {
  description = "OCID of the tenancy, used to check that the region is subscribed"
  type        = string
}
