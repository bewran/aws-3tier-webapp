# AWS Three-Tier Web Application — Cloud Engineering Portfolio

> **Status: in development.** This repository is a working application and infrastructure learning project, **not evidence of a completed production deployment**.

## Objective
Build and validate a secure, repeatable three-tier AWS web application: browser/frontend, Node.js API, and MySQL database, with Terraform and automated quality gates.

## Current verified repository scope
- **Node.js API:** `/health`, `/api/info`, and `/api/db-health` (database endpoint only succeeds with reachable MySQL).
- **Docker:** Node.js container definition and local Docker Compose with a private MySQL service.
- **Frontend:** static demonstration page; integration with the API remains planned.
- **Terraform:** **starter-only** VPC, a public subnet, internet gateway, and example EC2 instance with a placeholder AMI. **Do not apply it** in its current form.
- **CI:** proposed GitHub Actions workflow performs backend tests and Terraform formatting checks when enabled by GitHub Actions permissions.

## Gap analysis — claims vs implementation
| Feature | Current status | Next evidence needed |
| --- | --- | --- |
| VPC / public subnet | Terraform definition present | `terraform validate`, `terraform plan` |
| Private subnets across multiple AZs | Not implemented | Network module and plan |
| Internet/NAT routing | Internet gateway defined; routing incomplete | Route tables and tests |
| Load balancer / autoscaling | Not implemented | ALB, target groups, ASG |
| MySQL database | Local Compose service; no RDS | Secure RDS module, integration tests |
| Frontend-to-API connectivity | Not implemented | End-to-end browser test |
| Dockerized backend | Dockerfile included; build not yet verified | Successful CI image build |
| IAM least privilege, secrets, monitoring | Not implemented | Design and tests |
| AWS live deployment | **Not verified** | Approved deployment, sanitized evidence |

## Run locally (no AWS costs)
Requires Node.js 22+ and Docker Compose.

```sh
cd backend
npm install
npm test
npm start
# GET http://localhost:3000/health
```

Or from the repository root:

```sh
docker compose up --build -d
curl http://localhost:3000/health
curl http://localhost:3000/api/db-health
docker compose down -v
```

Compose credentials are **local demo defaults only**; never use them in AWS or commit actual secrets.

## Terraform safety
```sh
cd terraform
terraform fmt -check
terraform init -backend=false
terraform validate
```
No Terraform `apply` is permitted without explicit authorization and a reviewed cost estimate. The current Terraform file uses a **placeholder AMI** and lacks key resources.

## Portfolio completion criteria
1. Tests, Docker build, `terraform validate` and security scans succeed in CI.
2. Private application and database networking in two availability zones.
3. ALB + autoscaling + RDS architecture provisioned by reviewed IaC.
4. Secrets Manager, encryption, IAM least privilege, logging, and alarms.
5. Sanitized architecture diagram, CI proof, deployment verification (only after approval), and cleanup runbook.

## Safety
**No paid AWS resources are deployed or authorized by this repository.** CI must never run `terraform apply` automatically. Credentials and account IDs must not be checked in.

## Historical baseline
The original README asserted multi-AZ, ALB, ASG and MySQL deployment. At baseline commit `439ee811f979f181fd672755dd7b1b981bdb11f8`, the IaC only declared one VPC, one public subnet, one internet gateway, and one placeholder-AMI EC2 instance. This README intentionally separates the design from verified implementation.
