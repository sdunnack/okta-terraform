terraform {
  required_providers {
    onepassword = {
      source = "milosbackonja/1password"
      version = "~> 1.1.0"
    }
  }
  required_version = ">= 0.14"
}

# the email (OP_EMAIL), password (OP_PASSWORD), secret key (OP_SECRET_KEY), and subdomain (OP_SUBDOMAIN) that are required for the provider are set as environment variables
provider "onepassword" {}