# RoboShop AWS Infrastructure (Dev)

This repository contains Terraform code for provisioning the AWS infrastructure required to host the RoboShop application in a development environment. It focuses on core AWS networking and platform resources such as VPC, subnets, security groups, ALB, bastion access, and supporting infrastructure.

## Purpose

The project demonstrates how to:

- provision AWS networking layers using Terraform
- define reusable infrastructure modules
- configure security boundaries for application services
- build a dev-friendly environment for application deployment

## High-Level Architecture

The environment typically includes:

- VPC and subnet layout
- Security groups and ingress rules
- Bastion or jump host access
- Application load balancer
- Database and supporting resources
- Private/public networking separation

## Main Components

This repo is organized around infrastructure concerns such as:

- VPC and networking
- Security groups
- Bastion access
- Application-tier hosting
- Load balancing and routing
- Certificate or TLS configuration
- Supporting platform resources

## Typical Structure

```bash
.
├── vpc/
├── security-group/
├── bastion/
├── alb/
├── app/
├── modules/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
```

## Why This Matters

This repo is a strong example of infrastructure-as-code practice for a real-world application platform. It shows how application environments can be provisioned consistently and scaled using reusable Terraform modules instead of manual AWS setup.

## Typical Workflow

```bash
terraform init
terraform plan
terraform apply
```

After provisioning, the environment is ready for application deployment using tools like Ansible, Docker Compose, Kubernetes, or shell-based automation.

## Related Projects

- [roboshop-docker](https://github.com/dasariravi145/roboshop-docker)
- [roboshop-ansible](https://github.com/dasariravi145/roboshop-ansible)
- [ansible-roboshop-roles](https://github.com/dasariravi145/ansible-roboshop-roles)
- [roboshop-infra-eks](https://github.com/dasariravi145/roboshop-infra-eks)
- [k8-roboshop](https://github.com/dasariravi145/k8-roboshop)

## Notes

This repo is intended as an infrastructure example and portfolio project. It demonstrates practical AWS and Terraform skills used for building reproducible deployment environments.
