module "new_group_name" {
    source      = "./groups"
    name        = "my new group"
    description = "testing groups"
    users = [
        # list email addresses for folks that will be doing development
        "email+active@domain.com",
        "email2+active@domain.com"
    ]
}