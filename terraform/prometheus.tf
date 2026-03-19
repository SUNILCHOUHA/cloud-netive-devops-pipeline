resource "helm_release" "prometheus_stack" {
  name       = "prometheus"
  namespace  = "monitoring"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  values = [
    file("${path.module}/monitoring-values/prometheus-values.yaml")
  ]
}


resource "kubernetes_secret" "alertmanager_config" {
  metadata {
    name      = "alertmanager-custom-config"
    namespace = "monitoring"
  }

  data = {
    "alertmanager.yaml" = file("${path.module}/monitoring-values/alertmanager.yaml")
  }

  type = "Opaque"
}