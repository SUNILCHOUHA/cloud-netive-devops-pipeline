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

