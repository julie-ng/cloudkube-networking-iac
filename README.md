# cloudkube.io - Networking infrastructure

Separating out networking infrastructure from [julie-ng/cloudkube-aks-clusters](https://github.com/julie-ng/cloudkube-aks-clusters)  because networking has longer lifecycle than AKS clusters.

## Managed Resources

- **Resource Group**: `cloudkube-${env}-networking-rg` 
- **Virtual Network**: `cloudkube-${env}-vnet` 
- **Subne**: `aks-nodes-subnet` 
- **Subnet**: `aks-api-server-subnet` - [for API Server VNet integration](https://learn.microsoft.com/en-us/azure/aks/api-server-vnet-integration) 
- **Static Public I**: `cloudkube-${env}-aks-ingress-ip` - referenced for DNS records in [cloudkube-shared-infra](https://github.com/julie-ng/cloudkube-shared-infra) 

## IP Address Planning 

See also [Docs: Azure CNI IP Address Planning](https://learn.microsoft.com/en-us/azure/aks/azure-cni-overview#plan-ip-addressing-for-your-cluster).

### Managed IP Addresses

The following is defined in this repo

| Name | Address Space | # IPs |
|:--|:--|:--|
| Virtual Network | `10.0.0.0/16` | 65k |
| Subnet for AKS Nodes | `10.0.4.0/22` | 1024 |
| Subnet for API Server | `10.0.8.0/24` | 256|

### Reserved IP Addresses

| Name | Address | Notes |
|:--|:--|:--|
| Reserved for AKS Service | `10.0.0.0/22` | Cannot overlap with any subnet, otherwise [`ServiceCidrOverlapExistingSubnetsCidr`](https://learn.microsoft.com/en-us/troubleshoot/azure/azure-kubernetes/create-upgrade-delete/error-code-servicecidroverlapexistingsubnetscidr) error.|
| Reserved for K8s DNS Service IP* | `10.0.0.2` | Must exist in reserved for AKS service range and _not_ be the first address. |

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