resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "eks_reader_policy_attachment" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.eks_reader_policy.arn
}
