resource "helm_release" "prometheus_stack" {
  name       = "prometheus"
  namespace  = "monitoring"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  create_namespace = false
}