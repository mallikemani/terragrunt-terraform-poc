# Terraform + Terragrunt POC — Project Notes

## Project objective

Build a hands-on Terraform and Terragrunt proof of concept that supports:

* Terraform and Terragrunt interview preparation
* Internal developer platform architecture planning
* Reusable infrastructure modules
* Multiple environments
* Remote Terraform state
* Cross-component dependencies
* GitHub Actions automation

## Local project location

```text
/Users/mallikrajaemani/code/terragrunt-terraform-poc
```

## Tooling

* macOS on Apple Silicon
* Terraform 1.15.8
* Terragrunt 1.1.0
* Azure CLI 2.88.0
* Git 2.50.1
* Azure subscription: `mallik-sub`

## Target architecture

```text
Developer or platform engineer
             |
             v
        GitHub repository
             |
             v
       GitHub Actions
             |
             v
         Terragrunt
             |
             v
    Reusable Terraform modules
             |
             v
            Azure
```

## Phase 0 — workstation preparation

Completed:

* Installed Terraform
* Installed Terragrunt
* Installed Azure CLI
* Confirmed Git installation
* Authenticated to Azure with `az login`
* Confirmed the active Azure subscription
* Established the local project directory

## Phase 1 — plain Terraform resource group

Purpose:

* Understand Terraform before introducing Terragrunt
* Configure the AzureRM provider
* Create an Azure resource group
* Learn variables, locals, outputs, plans, applies, and state
* Make the first Git commit
* Publish the project to a private GitHub repository

### Terraform execution flow

```text
Terraform configuration
        |
        v
Terraform Core constructs dependency graph
        |
        v
AzureRM provider calls Azure Resource Manager
        |
        v
Azure creates or modifies resources
        |
        v
Terraform records returned attributes in state
```

### Important concepts

#### Terraform Core

Terraform Core reads configuration, evaluates expressions, builds the dependency graph, compares configuration with state, and creates an execution plan.

#### Provider

A provider is a plugin that allows Terraform to communicate with an external API. The AzureRM provider communicates with Azure Resource Manager.

#### Resource

A resource block describes an infrastructure object Terraform should manage.

Example resource address:

```text
azurerm_resource_group.this
```

#### Variable

A variable is an input supplied to a Terraform configuration.

#### Local value

A local value is a calculated internal value used to avoid repeating expressions.

#### Output

An output exposes a value produced by the Terraform configuration.

#### Plan

A plan describes the changes Terraform intends to perform before changing infrastructure.

#### State

Terraform state maps Terraform resource addresses to real infrastructure objects.

Current Phase 1 state location:

```text
labs/01-resource-group/terraform.tfstate
```

This is temporary local state. A later phase will migrate the platform configuration to an Azure Storage remote backend.

## Commands learned

```bash
terraform fmt -recursive
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan -out=tfplan
terraform show tfplan
terraform apply tfplan
terraform state list
terraform state show azurerm_resource_group.this
terraform output
terraform destroy
```

## Git rules

Commit:

* Terraform source files
* Terragrunt source files
* Documentation
* `.terraform.lock.hcl`
* Example variable files

Do not commit:

* `.terraform/`
* `.terragrunt-cache/`
* Terraform state
* Saved plans
* Local `terraform.tfvars`
* Credentials or secrets

## Interview explanation

Terraform is a declarative Infrastructure-as-Code tool. Terraform Core reads the desired configuration and existing state, builds a dependency graph, and creates an execution plan. Providers act as plugins that translate Terraform resource operations into calls against external APIs. In this POC, the AzureRM provider calls Azure Resource Manager to create an Azure resource group. After Azure returns the resource details, Terraform records the resource ID and other attributes in its state.



---------------------



