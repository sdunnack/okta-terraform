terraform {
  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
      version = "~> 3.10"
    }
  }
  required_version = ">= 0.14"
}

# the org_name, base_url, and api_token that are required for the provider are set as environment variables
provider "okta" {}
