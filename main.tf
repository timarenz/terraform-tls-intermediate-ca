/**
 * # TLS INTERMEDIATE CA CREATE MODULE
 *
 *
 * This modules creates an intermediate CA using provided root CA key and cert.
 *
 * ## USAGE
 *
 * Example usage:
 * ```terraform
 * module "intermediate-ca" {
 *  source = "../terraform-tls-intermediate-ca"
 *  
 * root_ca_cert        = file("${path.cwd}/ca-cert.pem")
 * root_ca_key         = file("${path.cwd}/ca-key.pem")
 * certificate_chain   = "path-to/certificate-chain.pem"
 * country             = "C"
 * organizational_unit = "OU"
 * common_name         = "CN"
 * organization_name   = "O"
 * locality            = "L"
 * province            = "ST"
 *
 * validity_period_hours = 168 # A Week
 * }
 */
