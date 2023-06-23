variable "private_key_algorithm" {
  description = "Algorithm to be used for private key encryption"
  type        = string
  default     = "RSA"
}

variable "private_key_ecdsa_curve" {
  description = "If the algorithm is ECDSA then we need to provide curve, otherwise is ignored"
  type        = string
  default     = "P256"
}

variable "private_key_rsa_bits" {
  description = "If the algorithm is RSA then we need to provide bits, otherwise is ignored"
  type        = string
  default     = "4096"
}

variable "root_ca_cert" {
  description = "Root CA cert to be used for Intermediate CA creation"
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^-----BEGIN CERTIFICATE-----", var.root_ca_cert))
    error_message = "Invalid root CA certificate format. It should be in PEM format."
  }
}

variable "root_ca_key" {
  description = "Root CA key to be used for Intermediate CA creation"
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^-----BEGIN PRIVATE KEY-----", var.root_ca_key))
    error_message = "Invalid root CA key format. It should be in PEM format."
  }
}

variable "organization_name" {
  description = "Distinguished name: O"
  type        = string
}

variable "country" {
  description = "Distinguished name: C"
  type        = string
}

variable "locality" {
  description = "Distinguished name: L"
  type        = string
}

variable "organizational_unit" {
  description = "Distinguished name: OU"
  type        = string
}

variable "province" {
  description = "Distinguished name: ST"
  type        = string
}

variable "common_name" {
  description = "Distinguished name: CN"
  type        = string
}

variable "uris" {
  description = "Allows to specify the URIs required for SPIFFE SVID Signing certificates"
  type        = list(string)
  default     = null
}

variable "validity_period_hours" {
  description = "Validity period to be used for Intermediate CA in hours"
  type        = string
  default     = 87660
}

variable "allowed_uses" {
  description = "Allowed uses for the Intermediate CA"
  type        = list(string)

  default = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
  ]
}
