# tf-azurerm-module_primitive-container_registry_token_password

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

A container registry token for Azure Container Registry. Combine this with a scope map and token password to yield a set of credentials for accessing your ACR.

## Local Development and Testing

To set yourself up for local development and testing activities, ensure you have the following software available on your PATH:

- make
- git (ensure your user.name and user.email are configured)
- [git-repo](https://gerrit.googlesource.com/git-repo#install)
- [`asdf`](https://asdf-vm.com) or [`mise`](https://mise.jdx.dev/)
- python3 (for pre-commit hooks)

You will also need to authenticate to the Cloud Provider. Terraform will use the default credential resolution mechanism, so ensure you are signed on through the CLI.

Clone this repository to your machine and issue the following command:

```
make configure
```

This will synchronize supporting repositories into this directory and expose additional targets.

To perform linting actions against the Terraform module and Terratests, issue the following command:

```
make lint
```

To provision cloud resources and perform tests against them, issue the following command:

```
make test
```

Note that `make test` causes the creation of some ignored files on your filesystem. This behavior is expected and we want to exclude any state or lockfiles from being pushed to the repository.

These two commands will be utilized in the pipeline and if you cannot run them successfully locally, you are unlikely to see a different result in the pipeline.

For convenience, a target exists that will execute both `make lint` and `make test` for you in sequence. Issue the following command to perform a holistic lint and test:

```
make check
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry_token_password.token_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_token_password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_registry_token_id"></a> [container\_registry\_token\_id](#input\_container\_registry\_token\_id) | The ID of the Container Registry Token that this Container Registry Token Password resides in. Changing this forces a new Container Registry Token Password to be created. | `string` | n/a | yes |
| <a name="input_password1_expiry"></a> [password1\_expiry](#input\_password1\_expiry) | The expiration date of the password in RFC3339 format. If not specified, the password never expires. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_password2_expiry"></a> [password2\_expiry](#input\_password2\_expiry) | The expiration date of the password in RFC3339 format. If not specified, the password never expires. Changing this forces a new resource to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container Registry Token Password. |
| <a name="output_password1"></a> [password1](#output\_password1) | n/a |
| <a name="output_password2"></a> [password2](#output\_password2) | n/a |
<!-- END_TF_DOCS -->
