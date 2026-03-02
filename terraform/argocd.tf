resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  chart   = "oci://ghcr.io/argoproj/argo-helm/argo-cd"
  version = "5.51.6"

  values = [
    yamlencode({
      server = {
        service = {
          type = "LoadBalancer"
        }
      }
    })
  ]

  depends_on = [
    aws_eks_node_group.nodes
  ]
}