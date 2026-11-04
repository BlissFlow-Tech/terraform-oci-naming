variable "prefix" {
  description = "Business or application prefix (e.g. app, platform)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9._-]+$", var.prefix))
    error_message = "prefix must only contain lowercase alphanumeric, ., -, _"
  }
}

variable "environment" {
  description = "Deployment environment (dev, qa, prod, etc.)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.environment))
    error_message = "environment must be lowercase alphanumeric"
  }
}

variable "region" {
  description = "OCI region (e.g. us-ashburn-1). Known regions map to their three-letter airport code; others use the first three characters."
  type        = string
}

variable "unique" {
  description = "Whether to append a random hex suffix that stays stable while prefix, environment and region stay the same"
  type        = bool
  default     = true
}

variable "unique_length" {
  description = "Length of the generated unique suffix"
  type        = number
  default     = 4

  validation {
    condition     = var.unique_length >= 2 && var.unique_length <= 8
    error_message = "unique_length must be between 2 and 8"
  }
}
