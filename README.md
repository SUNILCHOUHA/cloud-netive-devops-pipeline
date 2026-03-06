# 🚀 Cloud-Native DevOps Pipeline (AWS • Terraform • Kubernetes • GitOps)
This project demonstrates a production-style **Cloud-Native DevOps pipeline** designed to automate the complete lifecycle of an application — from infrastructure provisioning to automated deployment on Kubernetes.

The pipeline integrates **Infrastructure as Code (Terraform)**, **CI/CD automation (GitHub Actions)**, **containerization (Docker)**, and **GitOps-based deployment (ArgoCD)** running on **Amazon EKS**.

## 📌 Project Overview

Modern applications require automated infrastructure, reliable CI/CD, and scalable orchestration. This repository simulates a realistic DevOps workflow:

*   **Infrastructure:** Provisioned using Terraform (IaC).
*   **CI Pipeline:** GitHub Actions builds and pushes Docker images to Amazon ECR.
*   **Image Automation:** ArgoCD Image Updater detects new versions automatically.
*   **GitOps:** ArgoCD ensures the EKS cluster state matches the Git repository.

---

## 🏗️ System Architecture

### Architecture Flow
1.  **Developer Push:** Code is committed to the GitHub App Repository.
2.  **Continuous Integration (CI):** GitHub Actions builds, tags, and pushes the image to **Amazon ECR**.
3.  **Image Detection:** **ArgoCD Image Updater** monitors the registry for new tags.
4.  **GitOps Update:** The GitOps repository is automatically updated with the new image version.
5.  **Continuous Deployment (CD):** **ArgoCD** synchronizes the **Amazon EKS** cluster with the new manifests.
6.  **Deployment:** The application goes live on Kubernetes.

---

## ⚙️ Technology Stack


| Category | Technologies |
| :--- | :--- |
| **Cloud Platform** | AWS (EKS, ECR, VPC, IAM) |
| **Infrastructure as Code** | Terraform |
| **Containerization** | Docker |
| **Orchestration** | Kubernetes |
| **CI/CD Automation** | GitHub Actions |
| **GitOps Deployment** | ArgoCD & ArgoCD Image Updater |

---

## 📂 Repository Structure

```text
cloud-native-devops-pipeline
│
├── .github/workflows   # CI/CD pipeline definitions
├── app                 # Application source code and Dockerfile
├── argocd              # ArgoCD application configuration
├── gitops-repo         # GitOps managed deployment manifests
├── k8s-manifest        # Kubernetes deployment YAML files
├── terraform           # Infrastructure provisioning (VPC, EKS)
└── README.md
Use code with caution.


🚀 Getting Started
1️⃣ Clone the Repository
bash
git clone https://github.com/SUNILCHOUHA/cloud-netive-devops-pipeline.git
cd cloud-netive-devops-pipeline
Use code with caution.


2️⃣ Provision Infrastructure
bash
cd terraform
terraform init
terraform apply --auto-approve
Use code with caution.


3️⃣ Configure Kubernetes Access
bash
aws eks update-kubeconfig --region <your-region> --name <cluster-name>
Use code with caution.


4️⃣ Install ArgoCD
bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
Use code with caution.


📊 DevOps Concepts Demonstrated
Infrastructure as Code: Full environment reproducibility via Terraform.
GitOps: Single source of truth for infrastructure and application state.
Immutable Infrastructure: Deploying new container versions instead of patching.
Automation: Zero manual intervention from code commit to production.


📈 Future Improvements
Integrate Prometheus & Grafana for monitoring.
Implement Helm Charts for templating.
Add Trivy vulnerability scanning in the CI pipeline.
Implement multi-environment (Dev/Staging/Prod) logic.


👨‍💻 Author
Sunil Chouhan
Aspiring DevOps Engineer

⭐ If you found this project useful, consider starring the repository!




