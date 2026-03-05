resource "aws_iam_role" "argocd_image_updater_role" {
  name               = "argocd-image-updater-role"
  assume_role_policy = data.aws_iam_policy_document.argocd_image_updater_assume_role.json
}

resource "aws_iam_role_policy_attachment" "argocd_image_updater_attach" {
  role       = aws_iam_role.argocd_image_updater_role.name
  policy_arn = aws_iam_policy.argocd_image_updater_ecr_policy.arn
}

resource "helm_release" "argocd_image_updater" {
  name       = "argocd-image-updater"
  namespace  = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = "1.1.1"

  force_update = true
  recreate_pods = true
  cleanup_on_fail = true

  values = [
  yamlencode({
    serviceAccount = {
      create = true
      name   = "argocd-image-updater"
      annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.argocd_image_updater_role.arn
      }
    }

    config = {
      logLevel = "debug"

      registries = [
        {
          name    = "ecr"
          prefix  = "364478544576.dkr.ecr.ap-south-1.amazonaws.com"
          api_url = "https://364478544576.dkr.ecr.ap-south-1.amazonaws.com"
          ping    = true
          default = true
        }
      ]
    }
  })
]

  depends_on = [
    helm_release.argocd,
    aws_iam_role_policy_attachment.argocd_image_updater_attach
  ]
}

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
      identifiers = [aws_iam_openid_connect_provider.eks_connect.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_connect.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:argocd:argocd-image-updater"]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_connect.url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}
