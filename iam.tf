data "aws_iam_policy_document" "assume_role_policy" {

  statement {

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["${local.trusted_account_arns}"]
    }

    condition {
      test     = "Bool"
      values   = ["${local.mfa}"]
      variable = "aws:MultiFactorAuthPresent"
    }

  }

}

resource "aws_iam_role" "admin" {
  name               = "${local.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = "${aws_iam_role.admin.name}"
  policy_arn = "${local.policy_arn}"
}