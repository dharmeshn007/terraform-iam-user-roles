resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role-${var.environment}"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy-${var.environment}"
  description = "A test policy"
  policy      = "${file("policy.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment-${var.environment}"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}