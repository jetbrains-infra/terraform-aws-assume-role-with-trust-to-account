variable "require_mfa" {
  default = "true"
}

variable "trusted_account_ids" {
  type = "list"
}

variable "role_name" {
  default = "ExternalAdmin"
}

variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

locals {
  mfa                  = "${var.require_mfa}"
  trusted_account_arns = ["${formatlist("arn:aws:iam::%s:root", var.trusted_account_ids)}"]
  role_name            = "${var.role_name}"
  policy_arn           = "${var.policy_arn}"
}