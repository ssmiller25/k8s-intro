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
    - Focus on Agility.  HOw to become "cloud-like" without necessarily leveraging cloud
  - Survey
    - How would you describe your team or position:
      - Ops Focused (Sysadmin, etc.)
      - Dev Focused (Software Engineer, etc. )
      - DevOps (Full Stack, Site Reliability, Devops)
    - OS Platforms:
      - Linux
      - *nix
      - Windows
      - Docker

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

<!--v-->

## Selling the benefit, and address the concerns

Work within your environment

<aside class="notes">

- Although not focusing on Devops, reach out to your developers, and see if you can align with their tooling and methodology
  - Code editor(s)
  - Version Control
  - Pipelines
- But do **not** if it does not line up with your goals

</notes>

<!--v-->

## Selling the benefit, and address the concerns

Don't try to "boil the ocean"

<aside class="notes">
There are a lot of opportunity, but don't let that impeed you from taking more immediate action.  Better to take an Agile approach overall versus waterfall
</aside>

<!--s-->


## Step 1: Scripts

- Might already have them
- Or look for areas of "toil" that could be improved
  - Manual
  - Repetitve
  - Automatable

<aside class="notes">

- Scripts - but don't have to be too complex
  - Might already have these in place - in that case, work from those scripts that you are already using
  - More common in Linux environments, but Windows shops may have quite a collection of powershell as well
- Toil, as defined by Googe:  <https://sre.google/sre-book/eliminating-toil/>
- Example areas
  - Maintenance windows - probably common processes that are manually can be error prone due to human need
  - Pagable events - is there a common "page" and a set of actions to resolve (look at X items and perform Y actions)

</aside>

<!--v-->

## Step 1: Scripts

Scripting Langauges

- **Linux:** Shell/Python
- **Windows:** Powershell

<aside class="notes">

Languages to focus on initially

</aside>

<!--s-->

## Step 2: Version Control

Manage that code properly.  For operations

- Infinate Backups
- Blame Reports
- Peer Review and Approval

<aside class="notes">

Selling points

- Infiniate backups.  Not just the .bak, .bak2 or .20210201 extenions
- Blame reports.  Every wonder how added a line..and why?
- Peer review.  Actually force someone else to read your scripts.  Increases chances for catching mistakes

</aside>

<!--v-->

## Step 2: Version Control

Github - A good place to get started

<aside class="notes">

- HANDSON: VSCode and Github tutorial
  - [Github Hellow Word](https://guides.github.com/activities/hello-world/)
  - [Git Flow](https://guides.github.com/introduction/flow/)


</aside>

<!--v-->

## Step 2: Version Control

## IDE 

- Not Required, but can make Version Control Adoption Easier


<!--s-->

## Step 3: Pipelines for Your Scripts

- Testing The Scripts
- Implementing The Scripts

<aside class="notes">

You have the scripts, now implement them
HANDSON: Gitlab Actions walkthrough

[SuperLinter tutorial](https://docs.github.com/en/actions/quickstart)

</aside>



<!--s-->
## Conclusion

- Assist in:
  - Uptime - more automation and repeatable processes
  - Documentation: source code itself, along with other artifact, can serve as an important 

- Taking it Futher
  - Infrastructure as Code (IaC)
  - Configuration Management
  - Gitops/Kubernetes

<aside class="notes">

- Iac Frameworks
  - Useful for more cloud-based architectures
  - Terraform (probably biggest)
  - Pulumi
- Configuration Management
  - Useful for more traditional infrastructure.  In order of my perfernce
    - Ansible
    - Salt
    - Chef
    - Puppet
- GitOps/Kubernetes
  - More for Microservice styled architectures - but worthy of it's own discussion

</aside>

<!--s-->

## Thank You

<https://present.r15cookie.com>

<https://www.r15cookie.com>

<!--v-->

## Additioanl Resources

- Ansible
  - [Redhat's Anible Quickstart Guide](https://www.redhat.com/sysadmin/ansible-quick-start)
- Github
  - [Guides](https://guides.github.com/)
  - [Docs](https://docs.github.com/en)
  - [Oh Shit, Git!?!](https://ohshitgit.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- Google SRE Books
  - [Site Reliability Engineering](https://sre.google/sre-book/table-of-contents/)
  - [Site Reliability Workbook](https://sre.google/workbook/table-of-contents/)
  - [Building Reliable and Secure Systems (PDF)](https://static.googleusercontent.com/media/sre.google/en//static/pdf/building_secure_and_reliable_systems.pdf)