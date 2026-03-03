resource "aws_iam_policy" "argocd_image_updater_ecr_policy" {
  name        = "argocd-image-updater-ecr-policy"
  description = "Allow ArgoCD Image Updater to read ECR images"

  policy = data.aws_iam_policy_document.argocd_image_updater_ecr.json
}

data "aws_iam_policy_document" "argocd_image_updater_ecr" {
  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages"
    ]

    resources = ["*"]
  }
}



data "aws_iam_policy_document" "argocd_image_updater_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:argocd:argocd-image-updater"]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "argocd_image_updater_role" {
  name               = "argocd-image-updater-role"
  assume_role_policy = data.aws_iam_policy_document.argocd_image_updater_assume_role.json
}


resource "aws_iam_role_policy_attachment" "argocd_image_updater_attach" {
  role       = aws_iam_role.argocd_image_updater_role.name
  policy_arn = aws_iam_policy.argocd_image_updater_ecr_policy.arn
}