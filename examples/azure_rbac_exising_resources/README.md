# Azure RBAC Administration on Existing Resources

## Description

This terraform example creates new **AAD groups**, assigns **group owners** and also assigns RBAC permissions on existing resources.

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```HCL
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```HCL
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```  

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->