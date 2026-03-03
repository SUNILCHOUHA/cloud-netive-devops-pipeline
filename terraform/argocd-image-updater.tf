# resource "helm_release" "argocd_image_updater" {
#   name       = "argocd-image-updater"
#   namespace  = "argocd"

#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argocd-image-updater"
#   version    = "0.10.0"

#   force_update = true
#   recreate_pods = true
#   cleanup_on_fail = true

#   values = [
#     yamlencode({
#       serviceAccount = {
#         create = true
#         name   = "argocd-image-updater"
#         annotations = {
#           "eks.amazonaws.com/role-arn" = aws_iam_role.argocd_image_updater_role.arn
#         }
#       }

#       config = {
#         logLevel = "debug"
#       }

#       extraArgs = [
#         "--interval=2m",
#         "--aws-region=ap-south-1"
#       ]

#       extraEnv = [
#         {
#           name  = "AWS_REGION"
#           value = "ap-south-1"
#         }
#       ]
#     })
#   ]

#   depends_on = [
#     helm_release.argocd,
#     aws_iam_role_policy_attachment.argocd_image_updater_ecr_attach
#   ]
# }