resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "9.4.7"


  values = [
    yamlencode({
      server = {
        service = {
          type = "LoadBalancer"
        }
      }

      configs = {
        secret = {
          argocdServerAdminPassword = "$2y$10$1y4eQtkkKKxeIOiM5.WPRuWS08z.4YER30L.wGKw0P54tvbb10XMe"

        }
      }
    })
  ]

  depends_on = [
    aws_eks_node_group.nodes
  ]
}