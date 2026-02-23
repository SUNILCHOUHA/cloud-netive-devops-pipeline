🚀 Cloud-Native DevOps Pipeline (GitOps on AWS EKS)

This project demonstrates a production-grade Cloud-Native DevOps pipeline that provisions infrastructure on AWS and deploys containerized workloads to Amazon EKS using a GitOps-driven CI/CD workflow.

The architecture follows modern DevOps principles including:
Infrastructure as Code (IaC)
Secure CI pipeline
GitOps-based deployment
Automated image updates
Deployment hooks
RBAC-based access control
Drift detection & self-healing

🏗️ Architecture Overview
🔁 End-to-End Flow
Developer pushes code to GitHub.
GitHub Actions builds and pushes Docker images.
Images are stored in Docker Hub.
Argo CD Image Updater detects new image tags.
Git repository is updated automatically.
Argo CD syncs changes to Amazon EKS.
PreSync hooks validate before deployment.
Kubernetes deploys workloads.
Drift detection ensures cluster state matches Git.

🛠️ Tech Stack
☁️ Infrastructure
AWS (EKS, VPC, IAM, EC2)
Terraform
S3 + DynamoDB (remote backend)

🔄 CI/CD & GitOps
GitHub Actions
OIDC Authentication
Docker
Docker Hub
Argo CD
Argo CD Image Updater

☸️ Kubernetes
Deployments
Services
Ingress
HPA
Network Policies
Stateful workloads (optional)

🔐 GitOps & Security Features
✅ GitOps Deployment Model
No direct kubectl apply from CI
Argo CD manages deployment lifecycle

✅ Automated Image Updates
Image Updater commits new versions to Git
Fully automated deployment cycle

✅ Deployment Hooks
PreSync jobs for validation/migration
Controlled rollout strategy

✅ RBAC
Role-based access control
Read-only users
Restricted sync/delete permissions

✅ Drift Detection
Auto self-heal enabled
Manual changes automatically reverted

📁 Repository Structure
cloud-native-devops-pipeline/
│
├── terraform/
│   ├── vpc/
│   ├── eks/
│   └── backend.tf
│
├── app-source/
│   ├── Dockerfile
│   └── .github/workflows/
│
├── gitops-manifests/
│   ├── dev/
│   ├── stg/
│   ├── prod/
│   └── hooks/
│
└── README.md



🎯 Key Learning Outcomes
Designing GitOps-based CI/CD pipelines
Secure AWS authentication using OIDC
Infrastructure provisioning with Terraform
Kubernetes deployment automation with Argo CD
Automated container image version management
Deployment lifecycle control using hooks
Role-based access enforcement
Drift detection & cluster self-healing
