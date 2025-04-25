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

🏗️ Project Architecture Overview

1- Custom VPC with multiple subnets for enhanced security and network separation.

2- Public Subnets:
    Host the Application Load Balancer (ALB).
    Host the Node.js Web Servers (EC2 instances).
    
3- Private Subnets:
    Host the MySQL Database (secured with no direct internet access).
    
4- Security Groups:
    Strictly control and filter traffic between the public and private layers.
    
5-Docker:
    Containerizes the Node.js application for easy deployment and scalability.
    
6- Terraform:
    Automates the provisioning and configuration of the entire AWS infrastructure.
    
7-High Availability:
    Achieved through multi-AZ deployment across different Availability Zones.
    
8-Scalability:
    Enabled by Auto Scaling Groups behind the Application Load Balancer.

---

## 📂 Project Structure

aws-3tier-webapp/
├── frontend/
│   └── index.html
├── backend/
│   ├── app.js
│   └── Dockerfile
├── terraform/
│   └── main.tf
├── docs/
│   └── aws-3tier-architecture-diagram.png
├── README.md
---

## 🚀 How to Deploy

1. Clone the repository  git clone https://github.com/bewran/aws-3tier-webapp.git
2. Update Terraform variables for your AWS account
3. Initialize Terraform and apply (`terraform init` → `terraform apply`)
4. Build and push the Docker image
5. Deploy the frontend and set up a Load Balancer

---

## 🔗 GitHub Repository Link

[Click here to view the full project on GitHub](https://github.com/bewran/aws-3tier-webapp)

---
