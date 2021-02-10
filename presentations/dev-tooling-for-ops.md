---
theme : "league"
transition: "slide"
highlightTheme: "monokai"
slideNumber: true
title: "Incorporating Development Practices in Operations"
description: "The pace of change in today's modern technology landscape can make meeting business expectations difficult.   Various tools and processes will be presented to help increase the ability for operations to meet those expectations while also maintaining availability and compliance targets."
last-updated: "Feb 6, 2021 - In progress"
separator: <!--s-->
verticalSeparator: <!--v-->
revealOptions:
    transition: 'zoom'
---

## Incorporating Development Practices in Operations

 [Steve Miller](https://www.r15cookie.com) 

- Devops Practioner
- Sr. Systems Engineer at Plex Systems (Not **that** Plex...)

<aside class="notes">

GOAL: 30 minutes presentation, with 15-30 minute Q&A

- Introduction.

</aside>

<!--s-->

## Goal

Make operations more efficent by leveraging development tools and techniques.

<aside class="notes">
  - Notice not calling this "DevOps".  A far larger topic that generally involves having a far deeper connection between operatiosn and production.
  - Survey
    - How would you describe your team or position:
      - Ops Focused (Sysadmin, etc.)
      - Dev Focused
      - DevOps (Full Stack, Site Reliability, Devops)
    - OS Platforms:
      - Linux
      - *nix
      - Windows
      - Docker
  - Focus on Agility.  HOw to become "cloud-like" without necessarily leveraging cloud

</aside>

<!--s-->

## Selling the benefit, and address the concerns

- Benefits
  - Repeatability
  - Documentation
  - True history of changes - including authorship
  - Peer approval workflow
  - Auditability
- Concerns
  - "In a down situation, this may slow me down"
  - "I don't want to be a programmer"

<aside class="notes">

- Benefits
- "In an emergency, I just want to change a setting to fix something": 
  - That's ok, but how do we remember why that setting was changed in future years.   Even if put into a change management system, searching for it can be difficult
- "I don't want to be a programmer"
  - We work in IT, whose overall goal is to make our business more efficient by making processes more efficient and less manual.   We need to embrace that internally. 
    - And you don't need to be a full programmer

</aside>

<!--s-->


## Step 0: Scripts

Scripts and/or configuration tools:

- **Linux:** Shell/Python
- **Windows:** Powershell


<aside class="notes">

Since we want to incorporate lanugaes/tools

</aside>

<!--v-->

## Step 0: Configuration Management (Pet Servers)

- Ansible
- Salt
- Chef
- Puppet

<aside class="notes">

- Pet Servers: Built and kept for months/years
- Order my opinion on configuration management tools
- Very much my opinion - but prefer the light-weightness of Ansible.  Some work required in larger infrastructs to scale out to 100s/1000s of servers (if needed).  The easy of language/yaml makes up for this (IMHO)

</aside>

<!--v-->

## Step 0: Cloud Management Tools (Cattle Servers)

- Terraform or Pulumi


<aside class="notes">

- Cattle Servers: Build for a standard image, on demand
- Generally used for cloud infrastructure, although most can assist with on-prem (VMWare) with some work
- Terraform: FAR more popular, but a very unique "language" (HCL, not entirely Turning complete)
- Pulumi: Leverage concepts from Terraform (state) but can express in a variety of languages (Node.js, Python, .Net Core, Go)

</aside>

<!--s-->

## Step 1: Version Control

Manage that code properly.  For operations

- Infinate Backups
- Blame Reports
- Peer Review and Approval

<aside class="notes">

Selling points

- Infiniate backups.  Not just the .bak, .bak2 or .20210201 extenions


HANDS ON: Github startout

</aside>

<!--v-->

## Step 1: IDE/editor

- VScode
- Hands On: 

<!--s-->

<aside class="notes">

HANS ON: VSCode pointed to Github

</aside>

<!--s-->

## Step 2: Pipelines for Your Scripts

Implements your scripts

<aside class="notes">

You have the scripts, now implement them
HANDON: Gitlab Actions walkthrough

</aside>



<!--s-->
## Conclusion

- Assist in:
  - Uptime - more automation and repeatable processes
  - Documentation: source code itself, along with other artifact, can serve as an important 

- Taking it Futher 
  - Gitops
  - Kubernetes
  - Linting
  - Test and Test Drivent development

<aside class="notes">

</aside>

<!--s-->

## Thank You

<https://present.r15cookie.com>

<https://www.r15cookie.com>

<!--v-->

## Additioanl Resources

- Ansible
  - [Redhat's Anible Quickstart Guide](https://www.redhat.com/sysadmin/ansible-quick-start)