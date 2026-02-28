output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "ecr_url" {
  value = aws_ecr_repository.app_repo.repository_url
}