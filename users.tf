# Build employee list

locals {
    # Need the employee info firstname, lastname, Okta email address
    active = [
        "firstname,lastname,email+active@domain.com",
        "firstname,lastname,email2+active@domain.com"
    ]
    inactive = [
        "firstname,lastname,email+deac@domain.com"
    ]
}

resource "okta_user" "employees_active" {
    for_each = toset(local.active)
    first_name = element(split(",",each.value),0)
    last_name  = element(split(",",each.value),1)
    login      = element(split(",",each.value),2)
    email      = element(split(",",each.value),2)
    # setting the password so the user doesn't get an email to create an email
    password   = "thisismypassword"
    status     = "ACTIVE"

    lifecycle { ignore_changes = [password] }
}

resource "okta_user" "employees_inactive" {
    for_each = toset(local.inactive)
    first_name = element(split(",",each.value),0)
    last_name  = element(split(",",each.value),1)
    login      = element(split(",",each.value),2)
    email      = element(split(",",each.value),2)
    status     = "DEPROVISIONED"
}