data "aws_iam_policy_document" "eks_pod_execution_role_trust" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks-fargate-pods.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "ArnLike"
      values   = ["arn:aws:eks:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:fargateprofile/${var.cluster_name}/*"]
      variable = "aws:SourceArn"
    }
  }
}

resource "aws_iam_role" "eks_pod_execution_role" {
  name               = "eks_pod_execution_role"
  assume_role_policy = data.aws_iam_policy_document.eks_pod_execution_role_trust.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  ]
}
