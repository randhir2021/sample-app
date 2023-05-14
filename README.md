# lucs_project<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_docker"></a> [docker](#module\_docker) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks-cluster | n/a |
| <a name="module_helm"></a> [helm](#module\_helm) | ./modules/helm | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aggregate"></a> [aggregate](#output\_aggregate) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### Prerequisites of system going to use this module: 
1. Terraform latest version installed.
2. Docker installed and accessible through command line.
3. Helm installed on the system.
4. Kubectl installed on the system.
5. Gitbash installed [only for windows.]

### Steps to trigger the creation of resources and deployment of application.

1. Initialize the terraform. 
```
terraform init
```
2. View the plan by using below command.
```
terraform plan
```
3. Create the resources by running below command.
```
terraform apply -auto-approve
```