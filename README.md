# TLS INTERMEDIATE CA CREATE MODULE

This modules creates an intermediate CA using provided root CA key and cert.

## USAGE

Example usage:
```terraform
module "intermediate-ca" {
 source = "../terraform-tls-intermediate-ca"

root_ca_cert        = file("${path.cwd}/ca-cert.pem")
root_ca_key         = file("${path.cwd}/ca-key.pem")
country             = "C"
organizational_unit = "OU"
common_name         = "CN"
organization_name   = "O"
locality            = "L"
province            = "ST"

validity_period_hours = 168 # A Week
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tls_cert_request.intermediate_ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.intermediate_ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.intermediate_ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_uses"></a> [allowed\_uses](#input\_allowed\_uses) | Allowed uses for the Intermediate CA | `list(string)` | <pre>[<br>  "digital_signature",<br>  "cert_signing",<br>  "crl_signing"<br>]</pre> | no |
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | Distinguished name: CN | `string` | n/a | yes |
| <a name="input_country"></a> [country](#input\_country) | Distinguished name: C | `string` | n/a | yes |
| <a name="input_locality"></a> [locality](#input\_locality) | Distinguished name: L | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Distinguished name: O | `string` | n/a | yes |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | Distinguished name: OU | `string` | n/a | yes |
| <a name="input_private_key_algorithm"></a> [private\_key\_algorithm](#input\_private\_key\_algorithm) | Algorithm to be used for private key encryption | `string` | `"RSA"` | no |
| <a name="input_private_key_ecdsa_curve"></a> [private\_key\_ecdsa\_curve](#input\_private\_key\_ecdsa\_curve) | If the algorithm is ECDSA then we need to provide curve, otherwise is ignored | `string` | `"P256"` | no |
| <a name="input_private_key_rsa_bits"></a> [private\_key\_rsa\_bits](#input\_private\_key\_rsa\_bits) | If the algorithm is RSA then we need to provide bits, otherwise is ignored | `string` | `"4096"` | no |
| <a name="input_province"></a> [province](#input\_province) | Distinguished name: ST | `string` | n/a | yes |
| <a name="input_root_ca_cert"></a> [root\_ca\_cert](#input\_root\_ca\_cert) | Root CA cert to be used for Intermediate CA creation | `string` | `""` | no |
| <a name="input_root_ca_key"></a> [root\_ca\_key](#input\_root\_ca\_key) | Root CA key to be used for Intermediate CA creation | `string` | `""` | no |
| <a name="input_uris"></a> [uris](#input\_uris) | Allows to specify the URIs required for SPIFFE SVID Signing certificates | `list(string)` | `null` | no |
| <a name="input_validity_period_hours"></a> [validity\_period\_hours](#input\_validity\_period\_hours) | Validity period to be used for Intermediate CA in hours | `string` | `87660` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert"></a> [cert](#output\_cert) | Intermediate CA cert in PEM format. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | Intermediate CA private\_key in PEM format. |
