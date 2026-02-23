# Cloud-Native DevOps CI/CD Pipeline (AWS EKS)

This project demonstrates an **end-to-end Cloud-Native DevOps pipeline** that provisions infrastructure on AWS and deploys a **3-tier application** to a Kubernetes (EKS) cluster using **Terraform, Docker, and GitHub Actions**.

The setup follows **production-style DevOps practices**, including Infrastructure as Code (IaC), CI/CD automation, containerization, and Kubernetes-based application deployment.

---

## 🚀 Project Architecture Overview

**Workflow Summary:**
1. Developer pushes code from the local machine to GitHub.
2. GitHub Actions triggers CI/CD pipelines.
3. Terraform provisions AWS infrastructure and EKS cluster.
4. Docker images are built and pushed to Docker Hub.
5. Kubernetes pulls images and deploys the 3-tier application on EKS.
6. Users access the application via Ingress.

---

## 🛠️ Tech Stack

### Cloud & Infrastructure
- **AWS**: EKS, EC2, VPC, IAM, S3, DynamoDB
- **Terraform**: Infrastructure provisioning and state management

### DevOps & CI/CD
- **GitHub Actions** (CI/CD)
- **OIDC Authentication** (AWS & GitHub Actions)
- **Docker** (containerization)
- **Docker Hub** (image registry)

### Container Orchestration
- **Kubernetes (EKS)**
- Deployments, Services, Ingress
- Network Policies for secure pod communication

---

## 📦 Application Architecture (3-Tier)

### Frontend
- Kubernetes Deployment
- Kubernetes Service
- Exposed via Ingress

### Backend
- Kubernetes Deployment
- Internal Service (ClusterIP)

### Database
- Kubernetes Deployment
- Internal Service (ClusterIP only)

---

## 🔁 CI/CD Pipeline Flow (GitHub Actions)

**Triggers**
- `push`
- `pull_request`
- `workflow_dispatch`

**Pipeline Steps**
- Authenticate to AWS using OIDC
- Terraform `init`, `plan`, and `apply`
- Build Docker images
- Push images to Docker Hub
- Deploy Kubernetes manifests using `kubectl apply`

---

## 📁 Repository Structure
.
├── terraform/
│ ├── eks/
│ ├── vpc/
│ ├── iam/
│ └── backend.tf
├── k8s/
│ ├── frontend/
│ ├── backend/
│ └── database/
├── .github/
│ └── workflows/
│ ├── terraform.yml
│ └── docker.yml
├── 3-tier-app/
│ ├── frontend/
│ ├── backend/
│ └── database/
└── README.md


---

## 🔐 Security & Best Practices

- Remote Terraform backend using **S3 + DynamoDB**
- GitHub Actions authentication via **AWS OIDC** (no static credentials)
- Kubernetes **NetworkPolicies** for pod-to-pod security
- Environment separation (dev / staging / prod ready)
- Image versioning using **Git commit SHA**

---

## 🌐 Application Access

Once deployed, the application is accessible via:

---

## 🎯 Key Learning Outcomes

- End-to-end DevOps CI/CD pipeline design
- Production-style Terraform workflows
- Kubernetes application deployment on AWS EKS
- Secure cloud authentication using OIDC
- Containerized microservices deployment

---

## 📌 Future Enhancements

- Add monitoring with Prometheus & Grafana
- Implement Helm charts
- Add Argo CD for GitOps-based deployment
- Introduce auto-scaling (HPA)

---

## 👤 Author

**Sunil Chouhan**  
Aspiring DevOps Engineer  
GitHub: https://github.com/SUNILCHOUHA  
LinkedIn: https://www.linkedin.com/in/sunil-chouhan-07a45b36b/

---

⭐ If you find this project helpful, consider giving it a star!

replace this to new version
