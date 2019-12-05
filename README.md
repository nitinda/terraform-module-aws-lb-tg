# Terraform Module Name: terraform-module-lb-tg


## General

This module may be used to create Load Balancer Target Group resources in AWS cloud provider..

---


## Prerequisites

This module needs Terraform 0.12.16 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:

From branch : **_terraform-12/target-ip-instance_**

* **_Load Balancer Target Group (Terraform 12 supported code)_**


---

## Below are the resources that are launched by this module

* **_Load Balancer Target Group_**


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-lb-tg-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-lb-tg.git?ref=terraform-12/target-ip-instance"

  # Providers
  providers = {
    "aws" = "aws.services"
  }

  # Tags
  common_tags = merge(var.common_tags, map(
    "Description", "Load balancer Target Group",
    "ManagedBy", "Terraform"
  ))

  # ALB Target Group
  name                 = var.target_group_name
  port                 = var.target_group_port
  protocol             = var.target_group_protocol
  vpc_id               = var.vpc_id
  target_type          = var.target_group_type
  deregistration_delay = var.target_group_deregistration_delay
  health_check         = {
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    interval            = "5"
    matcher             = "200"
    path                = "/login"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "3"
  }
}

```


---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|         **_Variable_**          |        **_Description_**            |   **_Type_**   |
|---------------------------------|-------------------------------------|----------------|
| name                            | target group name                   | string         |
| port                            | Target Group Port                   | string         |
| protocol                        | Target Grop protocal                | string         |
| vpc_id                          | VPC ID                              | string         |
| health_check                    | Target Group Health Check           | map(string)    |
| deregistration_delay            | Delay in seconds                    | string         |
| common_tags                     | Tags                                | map(string)    |
| target_type                     | Target type                         | string         |




## Outputs

* **_dns\_name_**
* **_id_**
* **_arn_**




### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - **_Nitin Das_**