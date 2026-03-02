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
            "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub" = "system:serviceaccount:argocd:argocd-image-updater"
          }
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "image_updater_ecr" {
  role       = aws_iam_role.argocd_image_updater_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}