variable "private_key_algorithm" {
  type    = string
  default = "ECDSA"
}

variable "private_key_ecdsa_curve" {
  type    = string
  default = "P256"
}

variable "private_key_rsa_bits" {
  type    = string
  default = "2048"
}

variable "ca_cert" {
  type = string
}

variable "ca_key" {
  type = string
}

variable "ca_key_algorithm" {
  type = string
}

variable "organization_name" {
  type = string
}

variable "common_name" {
  type = string
}

variable "uris" {
  description = "Allows to specify the URIs required for SPIFFE SVID Signing certificates"
  type        = list(string)
  default     = null
}

variable "validity_period_hours" {
  description = "Default validity is 87660 hours which is 10 year"
  type        = string
  default     = 87660
}

variable "allowed_uses" {
  type = list(string)

  default = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
  ]
}
