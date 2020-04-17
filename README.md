# _Terraform Module Name: terraform-module-lb-tg_
_Terraform module for **_AWS Target Group_**_


<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>

---
<!--END STABILITY BANNER-->


## _General_

_This module may be used to create_ **_Target Group_** _resources in AWS cloud provider...._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.16_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_Target Group_**


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


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_name_** | _The name of the target group, Forces new resource_ | _string_ | **_Optional_** | **_null_** |
| **_name\_prefix_** | _Creates a unique name beginning with the specified prefix. Forces new resource_ | _string_ | **_Optional_** | **_null_** |
| **_port_** | _The port on which targets receive traffic, unless overridden when registering a specific target.Forces new resource.<br/>Required when_ **_target\_type_** _is_ **_instance_** _or_ **_ip_** | _number_ | **_Optional_** | **_null_** |
| **_protocol_** | _The protocol to use for routing traffic to the targets. Should be one of "TCP", "TLS", "UDP", "TCP\_UDP", "HTTP" or "HTTPS". Required when **target\_type** is instance or ip. Does not apply when **target\_type** is **lambda**._ | _number_ | **_Optional_** | **_null_** |
| **_vpc\_id_** | _The identifier of the VPC in which to create the target group. Required when **target\_type** is instance or ip. Does not apply when **target\_type** is **lambda**._ | _string_ | **_Optional_** | **_null_** |
| **_deregistration\_delay_** | _The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds._ | _number_ | **_Optional_** | **_300_** |
| **_load\_balancing\_algorithm\_type_** | _Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round\_robin or least\_outstanding\_requests. The default is **round\_robin**._ | _string_ | **_Optional_** | **_round\_robin_** |
| **_lambda\_multi\_value\_headers\_enabled_** | _Boolean whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when **target\_type** is **lambda**._ | _boolean_ | **_Optional_** | **_null_** |
| **_proxy\_protocol\_v2_** | _Boolean to enable / disable support for proxy protocol v2 on Network Load Balancers._ | _any_ | **_Optional_** | **_null_** |
| **_stickiness_** | _A Stickiness block. Stickiness blocks are documented below. stickiness is only valid if used with Load Balancers of type Application_ | _any_ | **_Optional_** | **_{}_** |
| **_health\_check_** | _A Health Check block_ | _map(string)_ | **_Optional_** | **_{}_** |
| **_target\_type_** | _The type of target that you must specify when registering targets with this target group._ | _string_ | **_Optional_** | **_{}_** |
| **_tags_** | _A mapping of tags to assign to the resource_ | _map(string)_ | **_Optional_** | **_{}_** |

---



## _Outputs_

* **_id_**
* **_arn_**
* **_name_**
* **_arn\_suffix_**


---


### _Usage_


_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```

---

## _Authors_
_Module maintained by Module maintained by the -_ **_Nitin Das_**
