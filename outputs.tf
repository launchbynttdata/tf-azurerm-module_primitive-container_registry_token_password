// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "id" {
  description = "The ID of the Container Registry Token Password."
  value       = azurerm_container_registry_token_password.token_password.id
}

output "password1" {
  sensitive = true
  value     = azurerm_container_registry_token_password.token_password.password1[0].value
}

output "password2" {
  sensitive = true
  value     = azurerm_container_registry_token_password.token_password.password2[0].value
}
