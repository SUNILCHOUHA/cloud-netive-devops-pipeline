🚀 Cloud-Native DevOps Pipeline on AWS (EKS + GitOps)

A production-style Cloud-Native DevOps pipeline designed to demonstrate modern DevOps practices including Infrastructure as Code, containerized applications, CI automation, and GitOps-based Kubernetes deployments.

This project implements a fully automated workflow where application builds, container image updates, and Kubernetes deployments happen automatically using industry-standard DevOps tools.

The pipeline integrates Terraform, Docker, GitHub Actions, AWS ECR, Amazon EKS, ArgoCD, and ArgoCD Image Updater to create a scalable and automated cloud deployment system.


🎯 Project Objective

The objective of this project is to build a real-world DevOps workflow that demonstrates:
Infrastructure provisioning using Terraform
Automated container image builds
Secure container registry integration
GitOps-based Kubernetes deployments
Automated image update detection
Continuous deployment to AWS EKS
This setup reflects the modern DevOps architecture used in production cloud environments.


🏗️ Architecture Overview
Developer
   │
   ▼
GitHub Repository
   │
   ▼
GitHub Actions (CI Pipeline)
   │
   ▼
Docker Image Build
   │
   ▼
Amazon ECR (Container Registry)
   │
   ▼
ArgoCD Image Updater
   │
   ▼
GitOps Repository Update
   │
   ▼
ArgoCD Sync
   │
   ▼
Amazon EKS Cluster
   │
   ▼
Kubernetes Deployment



⚙️ Core Technologies Used
☁️ Cloud Platform
AWS EKS – Managed Kubernetes cluster
Amazon ECR – Container image registry
IAM + IRSA – Secure cloud authentication


🏗 Infrastructure as Code
Terraform


📦 Containerization
Docker


⚡ Continuous Integration
GitHub Actions


☸️ Container Orchestration
Kubernetes


🔄 GitOps Deployment
ArgoCD
ArgoCD Image Updater


📂 Repository Structure
cloud-netive-devops-pipeline

app/
 ├── Dockerfile
 ├── requirements.txt
 └── application source code

terraform/
 ├──backend/
 ├── image-updater.tf
 ├── argocd.tf
 ├── backend-state.tf
 ├── ecr.tf
 ├── eks.tf
 ├── noded.tf
 ├── output.tf
 ├── provider.tf
 ├── variable.tf
 └── vpc.tf

argocd/
 └── application.yml

gitops-repo/
 ├── deployment.yaml
 └── service.yaml

.github/
 └── workflows/
     ├── bootstrap.yml
     ├── image-B&P.yml
     └── infra.yml
     

This structure separates application code, infrastructure configuration, and deployment manifests, following DevOps best practices.


🔄 CI/CD Pipeline Workflow
1️⃣ Code Commit

Developers push application code to the GitHub repository.

git push origin main
2️⃣ Continuous Integration (GitHub Actions)

The CI pipeline automatically:
Builds a Docker image
Tags the image
Pushes the image to Amazon ECR

Example workflow:
Docker Build → Image Tag → Push to ECR

3️⃣ Image Monitoring
ArgoCD Image Updater continuously monitors the ECR repository.

When a new image version is detected:
The GitOps repository is updated
A new commit is created with the updated image tag

4️⃣ GitOps Deployment

ArgoCD detects the change in the GitOps repository and automatically:
Syncs the new manifests
Deploys the updated application to the EKS cluster
This enables fully automated continuous deployment.

🔐 Secure AWS Access (IRSA)
The project implements IAM Roles for Service Accounts (IRSA).


This provides:
Secure authentication to Amazon ECR
No static AWS credentials stored in Kubernetes
Role-based access control for workloads

This is considered a production-grade security practice for Kubernetes workloads on AWS.


📦 Automated Image Updates
Deployment manifests include annotations used by ArgoCD Image Updater.

Example configuration:
annotations:
  argocd-image-updater.argoproj.io/image-list: argo-app=<ECR_REPO>
  argocd-image-updater.argoproj.io/update-strategy: newest-build
  argocd-image-updater.argoproj.io/write-back-method: git

These annotations allow automatic detection and deployment of new container images.


🛠 Infrastructure Provisioning

Initialize Terraform:
terraform init

Deploy infrastructure:
terraform apply

Terraform provisions:
VPC networking
Amazon EKS cluster
Node groups
Amazon ECR repository
IAM roles
ArgoCD installation
ArgoCD Image Updater


☸️ Application Deployment

Apply the ArgoCD application:
kubectl apply -f argocd/application.yml

ArgoCD automatically syncs the Kubernetes manifests from the GitOps repository.


📊 Verify Deployment

Check ArgoCD applications:
kubectl get applications -n argocd

Check Kubernetes workloads:
kubectl get pods



🖥 Access ArgoCD Dashboard

Port forward the ArgoCD service:
kubectl port-forward svc/argocd-server -n argocd 8080:443

Retrieve admin password:
kubectl get secret argocd-initial-admin-secret \
-n argocd \
-o jsonpath="{.data.password}" | base64 -d

Open the dashboard:
http://localhost:8080


📈 DevOps Concepts Demonstrated

This project demonstrates several important DevOps practices:
Infrastructure as Code
Containerized application deployment
Kubernetes orchestration
CI pipeline automation
GitOps-based continuous delivery
Automated container image updates
Secure cloud authentication with IRSA


🔮 Future Improvements
Potential enhancements include:
Helm-based deployments
Multi-environment GitOps workflows
Observability stack (Prometheus + Grafana)
Canary deployments with Argo Rollouts
Kubernetes security scanning

⭐ Project Highlights
✔ Fully automated GitOps deployment pipeline
✔ Infrastructure provisioned using Terraform
✔ CI automation using GitHub Actions
✔ Secure container registry integration with Amazon ECR
✔ Automated Kubernetes deployments using ArgoCD
✔ Dynamic container image updates with ArgoCD Image Updater

## 👤 Author  
**Sunil Chouhan**   
Aspiring DevOps Engineer   
GitHub: https://github.com/SUNILCHOUHA   
LinkedIn: https://www.linkedin.com/in/sunil-chouhan-07a45b36b/

If you found this project useful or interesting, feel free to ⭐ the repository.
