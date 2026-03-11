provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.main.token
}



provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.main.token

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = ["eks", "get-token", "--cluster-name", var.cluster_name]      
      }
  }

  registry_config_path = pathexpand("~/.config/helm/registry/config.json")
}


data "aws_eks_cluster" "eks" {
  name = aws_eks_cluster.eks.name
}


data "tls_certificate" "eks_certificate" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}


data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.eks.name
}



