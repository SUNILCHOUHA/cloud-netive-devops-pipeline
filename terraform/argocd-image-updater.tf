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
    })
  ]

  depends_on = [
    helm_release.argocd
  ]
}