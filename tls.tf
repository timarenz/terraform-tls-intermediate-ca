resource "tls_private_key" "intermediate_ca" {
  algorithm   = var.private_key_algorithm
  ecdsa_curve = var.private_key_ecdsa_curve
  rsa_bits    = var.private_key_rsa_bits
}

resource "tls_cert_request" "intermediate_ca" {
  private_key_pem = tls_private_key.intermediate_ca.private_key_pem

  subject {
    common_name         = var.common_name
    organization        = var.organization_name
    country             = var.country
    locality            = var.locality
    organizational_unit = var.organizational_unit
    province            = var.province
  }

  uris = var.uris
}

resource "tls_locally_signed_cert" "intermediate_ca" {
  cert_request_pem   = tls_cert_request.intermediate_ca.cert_request_pem
  ca_private_key_pem = var.root_ca_key
  ca_cert_pem        = var.root_ca_cert

  validity_period_hours = var.validity_period_hours
  is_ca_certificate     = true
  allowed_uses          = var.allowed_uses

}

resource "local_file" "certificate_chain" {
  content         = "${tls_locally_signed_cert.intermediate_ca.cert_pem}${var.root_ca_cert}"
  filename        = "${var.certificate_chain}/certficate-chain.crt.pem"
  file_permission = "0444"
}

