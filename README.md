# _Terraform Module Name: terraform-module-lb-tg_


<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->


## _General_

_This module may be used to create_ **_Load Balancer Target Group_** _resources in AWS cloud provider...._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.16_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_Load Balancer Target Group_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "alb_tg" {
  source = "git::https://github.com/nitinda/terraform-module-aws-lb-tg.git?ref=terraform-12/target-ip-instance"

  # Providers
  providers = {
    aws = aws.services
  }

  # Tags
  tags = {
    Description = "Load balancer Target Group"
    ManagedBy   = "Terraform"
    Project     = "POC"
    Environment = "prod"
  }

  # ALB Target Group
  name                 = var.target_group_name
  port                 = var.target_group_port
  protocol             = var.target_group_protocol
  vpc_id               = var.vpc_id
  target_type          = var.target_group_type
  health_check         = [
      {
          healthy_threshold   = 2
          unhealthy_threshold = 2
          interval            = 5
          matcher             = "200"
          path                = "/"
          port                = "traffic-port"
          protocol            = "HTTP"
          timeout             = 3
      }
  ]
}

```


---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Comments_** |
|:----|:----|-----:|-----:|
| **_name_** | _Target group name_ | _string_ | **_Required_** |
| **_port_** | _Target Group Port_ | _number_ | **_Required_** |
| **_protocol_** | _The protocol to use for routing traffic to the targets_ | _number_ | **_Required_** |
| **_vpc\_id_** | _The identifier of the VPC_ | _string_ | **_Required_** |
| **_health\_check_** | _A Health Check block_ | _map(string)_ | **_Required_** |
| **_deregistration\_delay_** | _Target Group Health Check_ | _number_ | **_Optional (Default - 300)_** |
| **_health\_check_** | _A Health Check block_ | _any_ | **_Required_** |
| **_target\_type_** | _The type of target that you must specify_ | _string_ | **_Required_** |
| **_tags_** | _A mapping of tags to assign to the resource_ | _map(string)_ | **_Required_** |

---



## _Outputs_

* **_id_**
* **_arn_**
* **_name_**
* **_arn\_suffix_**


---


### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```


_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```

---

## Authors
_Module maintained by Module maintained by the -_ **_Nitin Das_**