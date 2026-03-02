resource "aws_iam_policy" "argocd_image_updater_ecr_policy" {
  name        = "argocd-image-updater-ecr-policy"
  description = "Allow ArgoCD Image Updater to read ECR images"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages"
        ]
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_role" "argocd_image_updater_role" {
  name = "argocd-image-updater-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.eks.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${replace(data.aws_eks_cluster.main.identity[0].oidc[0].issuer, "https://", "")}:sub" = "system:serviceaccount:argocd:argocd-image-updater"
          }
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "argocd_image_updater_ecr_attach" {
  role       = aws_iam_role.argocd_image_updater_role.name
  policy_arn = aws_iam_policy.argocd_image_updater_ecr_policy.arn
}