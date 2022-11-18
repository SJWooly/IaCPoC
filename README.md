# About This Project

A proof of concept work which will use Terraform and AWS to construct a simple webserver with healthcheck.

# Running Locally

## Pre-Requistites
- AWS CLI install and authenticated
- Terraform installed
- SSH key generated

## Steps
- `terraform init` to initialise the Terraform workspace
- `terraform apply` to view the planned infrastructure changes, and confirm to apply these
-- you may need to run `terraform get` to pull in the module references to the overarching 'main.tf'
- run the healthcheck script by `./instanceHealcheck.sh`
- don't forget to `terraform destroy` afterwards

## Notes
- admittedly, I didn't put asside enough time for setting up a new personal machine before this project. Some additions I would've liked to include with more time:
    - more comprehensive healthcheck script including overarching chron job to periodically run the checks
    - 
- for simplicity, I have intentionally omitted:
    - tags
    - conditional creation/ count references (opting for simpler dependancy specification)
    - a private subnet (looking at commit history you can see I originally had one, but it is not necessary without a DB instance etc)

## TODO List
- tf fmt !!
- check @TODO comments