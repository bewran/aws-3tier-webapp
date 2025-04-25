# aws-3tier-webapp
A 3-tier architecture web application deployed on AWS with Node.js, MySQL, Docker, and Terraform.

# 🚀 AWS 3-Tier Web Application Project

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-blueviolet)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue)
![Node.js](https://img.shields.io/badge/Node.js-Backend-green)
![MySQL](https://img.shields.io/badge/MySQL-Database-lightblue)
![CI/CD](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-blue)

---

## 📋 Project Overview

This project sets up a 3-tier architecture web application on AWS:

- **Frontend**: HTML hosted in public subnets
- **Backend**: Node.js application hosted on private EC2 instances
- **Database**: MySQL RDS instance in private subnets
- **Infrastructure as Code**: Terraform used for all AWS resource provisioning
- **Containerization**: Backend application Dockerized
- **Automation**: CI/CD pipeline configured using GitHub Actions

---

## 📂 Project Structure

aws-3tier-webapp/ ├── frontend/ │ └── index.html ├── backend/ │ ├── app.js │ └── Dockerfile ├── terraform/ │ └── main.tf ├── docs/ │ └── aws-3tier-architecture-diagram.png ├── README.md

---

## 🚀 How to Deploy

1. Clone the repository
2. Update Terraform variables for your AWS account
3. Initialize Terraform and apply (`terraform init` → `terraform apply`)
4. Build and push the Docker image
5. Deploy the frontend and set up a Load Balancer

---

## 🔗 GitHub Repository Link

[Click here to view the full project on GitHub](https://github.com/bewran/aws-3tier-webapp)

---


