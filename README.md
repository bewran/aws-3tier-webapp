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

 Project Architecture Overview
Custom VPC setup with multiple subnets for better security and network separation.

Public Subnets:

Host the Application Load Balancer (ALB).

Host the Node.js Web Servers (EC2 instances).

Private Subnets:

Host the MySQL Database (secured, no direct internet access).

Security Groups configured to control traffic between layers.

Docker used for containerizing the Node.js application.

Terraform automates the entire infrastructure deployment.

High Availability achieved through multi-AZ deployment.

Scalability supported by Auto Scaling Groups behind the Load Balancer

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
