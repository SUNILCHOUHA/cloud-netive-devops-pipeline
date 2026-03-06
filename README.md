🚀 Cloud-Native DevOps Pipeline

A production-style Cloud-Native DevOps Pipeline demonstrating modern DevOps practices such as Infrastructure as Code, containerization, CI/CD automation, and GitOps-based Kubernetes deployments.

This project simulates a real-world DevOps workflow where application updates are automatically built, pushed to a container registry, and deployed to Kubernetes using GitHub Actions, ArgoCD, and Terraform on AWS.

📌 Project Goal

The goal of this project is to implement a complete automated DevOps pipeline that includes:

Infrastructure provisioning

Containerized application deployment

CI/CD automation

GitOps-based Kubernetes delivery

This repository demonstrates how modern cloud-native applications are deployed in production-like environments.

🏗 DevOps Architecture
Developer Push Code
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
Push Image to AWS ECR
        │
        ▼
ArgoCD Image Updater
        │
        ▼
Update GitOps Repository
        │
        ▼
ArgoCD Sync
        │
        ▼
Deployment to Kubernetes (EKS)
⚙️ Technologies Used
Category	Tools
Cloud Platform	AWS
Infrastructure as Code	Terraform
Containerization	Docker
Container Orchestration	Kubernetes
CI/CD	GitHub Actions
GitOps	ArgoCD
Image Automation	ArgoCD Image Updater
Version Control	Git & GitHub
OS	Linux
📂 Repository Structure
cloud-native-devops-pipeline
│
├── .github/workflows
│
├── app
│
├── argocd
│
├── gitops-repo
│
├── k8s-manifest
│
├── terraform
│
└── README.md
🔄 CI/CD Workflow
1️⃣ Code Commit

Developers push code changes to the GitHub repository.

2️⃣ Continuous Integration

GitHub Actions pipeline automatically:

Builds the Docker image

Tags the image

Pushes the image to AWS Elastic Container Registry (ECR)

3️⃣ Image Update

ArgoCD Image Updater detects the new container image and updates the deployment manifests in the GitOps repository.

4️⃣ GitOps Deployment

ArgoCD automatically syncs the updated manifests and deploys the application to Kubernetes (Amazon EKS).

☁️ Infrastructure Provisioning

Infrastructure is provisioned using Terraform.

Resources include:

AWS VPC

Public and Private Subnets

Internet Gateway

Security Groups

IAM Roles

Amazon EKS Cluster

Worker Nodes

This ensures the infrastructure is fully reproducible and version-controlled.

🚀 How to Run the Project
Clone the repository
git clone https://github.com/SUNILCHOUHA/cloud-netive-devops-pipeline.git
cd cloud-netive-devops-pipeline
Provision infrastructure
cd terraform
terraform init
terraform apply
Configure Kubernetes
aws eks update-kubeconfig --region <region> --name <cluster-name>
Deploy Kubernetes manifests
kubectl apply -f k8s-manifest/
📊 DevOps Concepts Demonstrated

This project demonstrates several core DevOps practices:

Infrastructure as Code (Terraform)

CI/CD automation with GitHub Actions

Containerized applications with Docker

Kubernetes-based deployments

GitOps workflows using ArgoCD

Automated container image updates

Cloud-native infrastructure design

👨‍💻 Author

Sunil Chouhan

Aspiring DevOps Engineer focused on building cloud-native infrastructure and automated deployment pipelines.

GitHub
https://github.com/SUNILCHOUHA

LinkedIn
https://www.linkedin.com/in/sunil-chouhan-07a45b36b/

⭐ Support

If you found this project useful, consider giving it a star ⭐ on GitHub.
