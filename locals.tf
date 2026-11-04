locals {
  region_short_map = {
    "us-ashburn-1"   = "iad"
    "us-phoenix-1"   = "phx"
    "us-sanjose-1"   = "sjc"
    "ap-melbourne-1" = "mel"
    "ap-mumbai-1"    = "bom"
    "ap-osaka-1"     = "osa"
    "ap-seoul-1"     = "sel"
    "ap-singapore-1" = "sin"
    "ap-sydney-1"    = "syd"
    "ap-tokyo-1"     = "tyo"
    "ca-montreal-1"  = "yul"
    "ca-toronto-1"   = "yyz"
    "eu-amsterdam-1" = "ams"
    "eu-frankfurt-1" = "fra"
    "eu-madrid-1"    = "mad"
    "eu-marseille-1" = "mrs"
    "eu-stockholm-1" = "sto"
    "uk-cardiff-1"   = "cwl"
    "uk-london-1"    = "lhr"
    "sa-sao-paulo-1" = "gru"
  }

  region_short = lookup(
    local.region_short_map,
    var.region,
    substr(var.region, 0, 3)
  )

  unique_suffix = var.unique ? substr(random_id.suffix.hex, 0, var.unique_length) : ""

  base_parts = compact([
    var.prefix,
    var.environment,
    local.region_short
  ])

  base = join("-", local.base_parts)
}
