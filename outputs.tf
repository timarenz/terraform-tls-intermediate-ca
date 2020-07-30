output "private_key" {
  value     = tls_private_key.intermediate_ca.private_key_pem
  sensitive = true
}

output "cert" {
  value = tls_locally_signed_cert.intermediate_ca.cert_pem
}

output "key_algorithm" {
  value = tls_private_key.intermediate_ca.algorithm
}
