# AWS 3-Tier Web Application (work in progress)

A portfolio project for developing a secure three-tier AWS architecture using Terraform, Docker, Node.js, and (planned) MySQL.

> **Status:** The complete three-tier cloud infrastructure is **not yet implemented or deployed**. The Terraform now **defines** a proposed multi-AZ VPC architecture with public ALB, private Docker application tier, isolated RDS MySQL tier, and NAT for application egress. No AWS services have been deployed. Do not run `terraform apply` until the configuration, costs, and risks are reviewed.

## Current repository

| Component | Status |
| --- | --- |
| Frontend | Static HTML prototype in `frontend/index.html` |
| Backend | Express API in `backend/app.js`; `GET /` and `GET /health` |
| Docker | Backend Dockerfile and local `compose.yaml` |
| Terraform | Proposed two-AZ VPC, ALB, private EC2 Auto Scaling Group, NAT, isolated RDS MySQL; **code only** |
| CI | GitHub Actions for Node.js tests and Terraform validation, **no AWS deployment** |
| Database | RDS MySQL resource **defined in Terraform**; Node.js integration still pending |
| Load balancer, private subnets, Auto Scaling | **Defined in Terraform**; not deployed or verified |

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

## Architecture defined in Terraform (not deployed)

- Public web entry: AWS Application Load Balancer spanning public subnets.
- Application: containerized Node.js service on private compute, with controlled inbound traffic.
- Data: isolated MySQL database in private subnets.
- Security: least-privilege IAM, security groups, secrets management, and logging.
- Reliability: multi-AZ networking and scaling as an *optional* paid implementation.

The full ALB, NAT, compute, and database design can incur ongoing AWS charges even at low traffic. Review budgets and pricing before provisioning.

## Repository

[bewran/aws-3tier-webapp](https://github.com/bewran/aws-3tier-webapp)

## Architecture status and cost safeguards

The proposed architecture follows this path: **Internet → public ALB (two AZs) → private EC2 Auto Scaling Group (two AZs, Docker API) → private RDS MySQL**. Application instances use a NAT Gateway for outbound image downloads; database subnets have no default Internet route. The NAT Gateway is intentionally single-AZ for the draft, so full multi-AZ high availability is **not** achieved yet.

This is an architecture *definition*, not evidence of deployed infrastructure. It has known gaps: the application does not yet connect to MySQL, no HTTPS/ACM is configured, the backend container image must be published first, the database is single-AZ, and EC2 bootstrapping is not tested.

### Deployment cost warning

**Do not run `terraform apply` without explicit approval.** ALB, NAT Gateway, Elastic IP/public IPv4, two EC2 instances, RDS, EBS, Secrets Manager, data transfer, and logging can all incur charges. Terraform `plan` requires AWS credentials and can query AWS but does not itself provision resources. Validation and code review come first.
