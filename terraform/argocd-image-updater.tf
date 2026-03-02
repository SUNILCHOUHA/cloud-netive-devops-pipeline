resource "helm_release" "argocd_image_updater" {
  name      = "argocd-image-updater"
  namespace = "argocd"

  chart   = "oci://ghcr.io/argoproj/argo-helm/argocd-image-updater"
  version = "0.10.0"

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
        registries = [
          {
            name      = "ecr"
            api_url   = "https://364478544576.dkr.ecr.ap-south-1.amazonaws.com"
            prefix    = "364478544576.dkr.ecr.ap-south-1.amazonaws.com"
            ping      = true
            insecure  = false
            awsRegion = "ap-south-1"
          }
        ]
      }
    })
  ]

  depends_on = [
    helm_release.argocd,
    aws_iam_role_policy_attachment.argocd_image_updater_ecr_attach
  ]
}