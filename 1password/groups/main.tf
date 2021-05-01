variable "group_name" {
  type        = string
  description = "Name of the group"
}

variable "users" {
  type        = set(string)
  description = "User Okta emails to place in the group"
}
resource "onepassword_group" "group" {
  group = "new-group"
}

data "onepassword_user" "user" {
  email = "example@example.com"
}

resource "onepassword_group_member" "example" {
  group = onepassword_group.group.id
  user = data.onepassword_user.user.id
  depends_on = [onepassword_group.group.id]
}