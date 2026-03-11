resource "helm_release" "prometheus" {
  name      = "prometheus"
  namespace = "monitoring"

  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "58.2.0"

  values = [
    file("${path.module}/monitoring-values/prometheus-values.yaml")
  ]
}