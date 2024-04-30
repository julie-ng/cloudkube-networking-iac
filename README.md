# cloudkube.io - Networking infrastructure

Separating out networking infrastructure from AKS IaC because networking has longer lifecycle than AKS clusters.

### Related Repos

- [julie-ng/cloudkube-aks-clusters](https://github.com/julie-ng/cloudkube-aks-clusters) 
- [julie-ng/cloudkube-shared-infra](https://github.com/julie-ng/cloudkube-shared-infra) 

## Usage

> [!NOTE]
> This repo (currently) uses local state file.

Initialize Terraform

```bash
terraform init
```

Preview infra changes and pass in environment specific params, e.g. `environments/dev.tfvars` to `-var-file` flag.

```bash
terraform plan -var-file=environments/dev.tfvars -o plan.tfplan
```

If satisifed, apply changes

```bash
terraform apply plan.tfplan
```