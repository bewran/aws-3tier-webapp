# AWS 3-Tier Web Application (work in progress)

A portfolio project for developing a secure three-tier AWS architecture using Terraform, Docker, Node.js, and (planned) MySQL.

> **Status:** The complete three-tier cloud infrastructure is **not yet implemented or deployed**. The current Terraform defines one VPC, one public subnet, an Internet Gateway, and an EC2 instance with a **placeholder AMI**. Do not run `terraform apply` until the configuration and costs are reviewed.

## Current repository

| Component | Status |
| --- | --- |
| Frontend | Static HTML prototype in `frontend/index.html` |
| Backend | Express API in `backend/app.js`; `GET /` and `GET /health` |
| Docker | Backend Dockerfile and local `compose.yaml` |
| Terraform | Basic VPC and EC2 example; incomplete and not deployment-ready |
| CI | GitHub Actions for Node.js tests and Terraform validation, **no AWS deployment** |
| Database | Planned, **not implemented** |
| Load balancer, private subnets, Auto Scaling | Planned, **not implemented** |

## Run the API locally

Requires Docker with Compose installed:

```bash
docker compose up --build
curl http://localhost:3000/health
docker compose down
```

The health endpoint returns `{"status":"ok"}`. The sample frontend is static and is **not yet connected** to the API or database.

Alternatively, with Node.js 22 or later:

```bash
cd backend
npm install
npm test
npm start
```

## Terraform checks (do not deploy)

Install Terraform, then run:

```bash
cd terraform
terraform fmt -check
terraform init -backend=false
terraform validate
```

These commands check formatting/configuration; they do **not** create AWS infrastructure. `terraform init` can download provider plugins but doesn't deploy AWS services when the backend is disabled. **Do not run `terraform apply` or automated deployments without explicit cost approval.**

## Planned architecture

- Public web entry: AWS Application Load Balancer spanning public subnets.
- Application: containerized Node.js service on private compute, with controlled inbound traffic.
- Data: isolated MySQL database in private subnets.
- Security: least-privilege IAM, security groups, secrets management, and logging.
- Reliability: multi-AZ networking and scaling as an *optional* paid implementation.

The full ALB, NAT, compute, and database design can incur ongoing AWS charges even at low traffic. Review budgets and pricing before provisioning.

## Repository

[bewran/aws-3tier-webapp](https://github.com/bewran/aws-3tier-webapp)
