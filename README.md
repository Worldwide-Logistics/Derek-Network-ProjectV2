# Network and Security Workshop
The goal of this workshop is to become more familiar with going slightly more in depth with network resources provided by AWS. The workshop is broken into these major components:

- VPC, Subnets, and Routing
- Security and Logging
- Connecting VPCs
- Connecting to On Prem

As well as having to write code there is also a [report](REPORT.md) to fill out to make sure important concepts are understood. This report does not have to be checked but can be verified by looking at previous iterations of this workshop and by someone who has gone through this workshop before.

## VPC, Subnets, and Routing

**Goal:** Learn how to use subnets and let them access the internet

Tasks:

- **Fill out Number 1 in report**
- Create a data sources for each of the existing VPCs
    - Each VPC has the tag `NetworkWorkshopName` which can be used for identification
- Create a public subnet in dev with connection to the internet
  - Create a internet gateway resource to already existing gateway
  - Create a Route Table, and route to internet gateway
- Create a private subnet in dev with connection to the internet
  - Create a public NAT, Route Table, and route to NAT

## Security

**Goal:** Learn how to restrict access using subnets

Tasks:

- **Fill out Number 2 in report**
- Create a security group (`web`) which allows ssh traffic from anywhere and apply to public subnet
- Create a security group (`servers`) which allows ssh traffic from web only and apply to private subnet
- Create ec2 instances in public and private subnets using modules provided.
- Verify that
  - The public EC2 instance can be connected to publicly
  - The private EC2 instance cannot be connected publicly
  - The private EC2 instance can be connected to privately via the public EC2 instance

## DNS

**Goal:** Learn how to utilize DNS to resolve ec2 instances

**Note:** The vpcs are created with the options:
```terraform
enable_dns_support: true
enable_dns_hostnames: true
```

Tasks:
* Update the ec2 module to give the private ec2 instance a dedicated domain.
  * This should be a **private** domain.
* Validate the domain works by connecting via SSH