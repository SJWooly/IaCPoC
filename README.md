# About This Project

A proof of concept work which will use Terraform and AWS to construct a simple webserver with healthcheck.

# Running Locally

## Pre-Requistites
- AWS CLI install and authenticated
- Terraform installed

## Steps
- `terraform init` to initialise the Terraform workspace
- `terraform apply` to view the planned infrastructure changes, and confirm to apply these
- don't forget to `terraform destroy` afterwards


@TODO List
- jog memory on breakdown of TF module structure
- further define how I am interpreting the project with greater detail
    - currently: VPC, subnets, SGs, EC2, healthcheck
- tf fmt !!
- extrapolate overacrhing config, add tags (?)
- healthcheck in aws, or bashscript to ping with updates etc?