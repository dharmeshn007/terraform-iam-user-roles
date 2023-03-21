resource "aws_iam_user" "demo" {
  count = "${length(var.username)}"
  name = "${element(var.username,count.index )}"-"${var.environment}"
}

resource "aws_iam_user_policy" "test_policy" {
  count = length(var.username)
  name = "policy-${var.environment}"
  user = element(var.username,count.index)
  policy = "${file("policy.json")}"
# policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "ec2:Describe*"
#       ],
#       "Resource": "*"
#     }
#   ]
# }
# EOF
}