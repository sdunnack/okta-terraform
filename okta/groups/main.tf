terraform {
  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
      version = "~> 3.10"
    }
  }
  required_version = ">= 0.14"
}

data "okta_user" "group_users" {
  for_each = var.users
  search {
    name  = "profile.login"
    value = each.value
  }
}

variable "name" {
  type        = string
  description = "Group name"
}

variable "description" {
  type        = string
  description = "Group description" 
}

variable "users" {
  type        = set(string)
  description = "User Okta emails to place in the group"
}

resource "okta_group" "group" {
  name        = var.name
  description = var.description
  users       = [for user_email in var.users: data.okta_user.group_users[user_email].id]
}