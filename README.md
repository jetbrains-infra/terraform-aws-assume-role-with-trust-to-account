## About

Terraform module to create IAM role with trust to specific AWS account:

### Params

* `role_name` - name of the role (default: `ExternalAdmin`)
* `require_mfa` - force MFA from user who assume the role (default: `true`)
* `trusted_account_ids` - numeric IDs of trusted AWS accounts
* `policy_arn` - policy ARN that would be attached to the role (default: `arn:aws:iam::aws:policy/AdministratorAccess`)

## Usage
 
```
module "external_admin_role" {
    source              = "github.com/jetbrains-infra/terraform-aws-assume-role-with-trust-to-account?ref=v0.1.0"
    role_name           = "ExternalAdmin"
    policy_arn          = "arn:aws:iam::aws:policy/AdministratorAccess"
    trusted_account_ids = [
      "123456789012",
      "323456789012"
    ]
}
```