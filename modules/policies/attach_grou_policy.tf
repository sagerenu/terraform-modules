provider "aws" {

  region = "us-east-1"
  access_key = "${var.my-access-key}"
  secret_key = "${var.my-secret-key}"

}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = "${file("./RegionalDeny_iam_policy.json")}"              # insert policy here
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = "${var.aws_iam_group}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
