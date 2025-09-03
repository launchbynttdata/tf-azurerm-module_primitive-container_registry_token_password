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

variable "container_registry_token_id" {
  description = "The ID of the Container Registry Token that this Container Registry Token Password resides in. Changing this forces a new Container Registry Token Password to be created."
  type        = string
  nullable    = false
}

variable "password1_expiry" {
  description = "The expiration date of the password in RFC3339 format. If not specified, the password never expires. Changing this forces a new resource to be created."
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.password1_expiry == null ? true : can(formatdate("YYYY-MM-DD'T'hh:mm:ssZ", var.password1_expiry))
    error_message = "The password expiration date must be a valid RFC3339 timestamp (e.g., '2024-12-31T23:59:59Z')."
  }
}

variable "password2_expiry" {
  description = "The expiration date of the password in RFC3339 format. If not specified, the password never expires. Changing this forces a new resource to be created."
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.password2_expiry == null ? true : can(formatdate("YYYY-MM-DD'T'hh:mm:ssZ", var.password2_expiry))
    error_message = "The password expiration date must be a valid RFC3339 timestamp (e.g., '2024-12-31T23:59:59Z')."
  }
}
