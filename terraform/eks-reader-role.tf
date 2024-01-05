data "aws_iam_policy_document" "eks_reader_policy" {
  statement {
    effect = "Allow"
    actions = [
      "eks:ListFargateProfiles",
      "eks:DescribeNodegroup",
      "eks:ListNodegroups",
      "eks:ListUpdates",
      "eks:AccessKubernetesApi",
      "eks:ListAddons",
      "eks:DescribeCluster",
      "eks:DescribeAddonVersions",
      "eks:ListClusters",
      "eks:ListIdentityProviderConfigs",
      "iam:ListRoles",
      "ssm:GetParameter"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "eks_reader_policy" {
  name        = "EKSReaderPolicy"
  path        = "/"
  description = "read only access to EKS"
  policy      = data.aws_iam_policy_document.eks_reader_policy.json
}
