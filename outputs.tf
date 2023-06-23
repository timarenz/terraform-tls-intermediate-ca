output "private_key" {
  description = "Intermediate CA private_key in PEM format."
  value       = tls_private_key.intermediate_ca.private_key_pem
  sensitive   = true
}

output "cert" {
  description = "Intermediate CA cert in PEM format."
  value       = tls_locally_signed_cert.intermediate_ca.cert_pem
}

output "certificate_chain" {
  description = "Certificate chain contents."
  value       = local_file.certificate_chain.content
}
