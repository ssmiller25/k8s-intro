---
theme : "league"
transition: "slide"
highlightTheme: "monokai"
slideNumber: true
title: "Incorporating Development Practices in Operations"
description: "The pace of change in today's modern technology landscape can make meeting business expectations difficult.   Various tools and processes will be presented to help increase the ability for operations to meet those expectations while also maintaining availability and compliance targets."
last-updated: "Feb 19, 2021"
separator: <!--s-->
verticalSeparator: <!--v-->
revealOptions:
    transition: 'zoom'
---

## Incorporating Development Practices in Operations

 [Steve Miller](https://www.r15cookie.com) 

- Devops Practioner
- Sr. Systems Engineer at Plex Systems (Not **that** Plex...)

Note:

GOAL: 30 minutes presentation, with 15-30 minute Q&A

- Introduction of myself
  - Sr. Systems Engineer at Plex
  - Multiple other Devops and System Admin roles across a variety of company sizes as well as public institutions
  - Passion for DevOps Practices

<!--s-->

## Goal

Make operations more efficient by leveraging development tools and techniques.

Note:

- Notice not calling this "DevOps".  Far larger topic
  - Focus on existing operational teams, and practices to make them more efficient (Agile)
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

<!--s-->

## Selling Change

Change is hard - make sure you have a good plan to sell it.

Note:

- No matter if your an individual contributor pitching this to your team or a manager, you need to get buy-in.

<!--v-->

## Selling Change

- Highlight Benefits
  - Reduce Toil
  - True History of Changes - including authorship
  - Documentation
  - Peer Review workflow

Note:

- Toil, as defined by Google:  <https://sre.google/sre-book/eliminating-toil/>
- History of changes
  - How many times have you seen a recent change, and when "why"...and really "who did this change"
  - Why is this particular flag flips...say a configuration on a load balancer
- Documentation: Reduce hidden processes.
  - At a minimum you have a script that can be reviewed for the process
  - Better yet, documentation alongside the script explaining the "why"
- Peer Review Workflow
  - Make everyone better by requiring at least one person to review

<!--v-->
## Selling Change

- Address Concerns
  - "I don't want to be a programmer"
  - "In a outage situation, this may slow me down"

Note:

- "I don't want to be a programmer"
  - Don't need to be full programmer
  - IT is about automation overall
- "In an emergency, I just want to change a setting to fix something": 
  - More issue with IaC
  - One off changes are "tech debt".  Have process to control/root cause analysis
  - Hard to document or follow through if outside code


<!--v-->
## Selling Change

Work within your environment

Note:

- This presentation: using specific tools
- Reach out to developers
  - Code editor(s)
  - Version Control
  - Pipelines
- But do **not** let it slow you down if tools inappropriate

</notes>

<!--v-->

## Selling the benefit, and address the concerns

Don't try to tackle everything at once ("boil the ocean")

Note:

- Easy to get excited
- Take an Agile approach

<!--s-->
## Step 1: Scripts

- Might already have them
- Or look for areas of toil that could be improved
  - Manual
  - Repetitive
  - Automate-able

Note:

- Scripts - but don't have to be too complex
  - Might already have these in place - in that case, work from those scripts that you are already using
  - More common in Linux environments, but Windows shops may have quite a collection of powershell as well
- Example areas
  - Maintenance windows - probably common processes that are manually can be error prone due to human need
  - Page-able events - is there a common "page" and a set of actions to resolve (look at X items and perform Y actions)

<!--v-->
## Step 1: Scripts

Scripting Languages

- **Linux:** Shell/Python
- **Windows:** Powershell

Note:

- Languages to focus on initially
- Target existing experience

<!--v-->
## Step 1: Scripts

Hands On Example: Log Cleanup

- First have to have some test logs

```sh
#!/bin/sh
LOGDIR=${LOGDIR:="/tmp/logdir"}
mkdir -p $LOGDIR
for i in $(seq 1 14); do
  newdate=$(date +%Y%m%d -d now-${i}days)
  touch -d ${newdate} ${LOGDIR}/file-${i}.log 
done
```

Note:

- Cleanup files older then X on a regular basis
- COPY: Links to actual "raw" download on Github

<!--v-->
## Step 1: Scripts

Hands On Example: Log Cleanup

```sh
#!/bin/sh

LOGDIR=${LOGDIR:="/tmp/logdir"}
MAXAGE=${MAXAGE:="7"}

find ${LOGDIR} -mtime +${MAXAGE} | xargs ls -l
```

<sub>Avoiding the actual deletion...</sub>

Note:

- Now we clean up the files
  - Yes, not really putting the delete in there...just in case...

<!--s-->

## Step 2: Version Control

Manage that code properly.  For operations

- Infinite Backups
- Blame Reports
- Peer Review and Approval

Note:

Selling points

- Infinite backups.  Not just the .bak, .bak2 or .20210201 extensions
- Blame reports.  Every wonder how added a line..and why?
- Peer review.  Actually force someone else to read your scripts.  Increases chances for catching mistakes

<!--v-->
## Step 2: Version Control

Github - A good place to get started

Note:

- Need both a source control system along with the system around code reviews, pipeline automation , etc
  - Github ideal if getting started.  Well known in the public community, owned by Micorosft
  - Other ones you might run already in your company
    - Azure DevOps (what was Microsoft TFS a **long** time ago)
    - Atlassian BitBucket
    - Gitlab
    - And many other options
- HANDSON: VSCode and Github tutorial
  - Sign-up for github:  https://www.github.com
  - Will need a legit email.
  - Create our first repo
  - Pay attention to **private** or **public**
  - Also, emphasis **no private data should ever be uploaded to a repo directly!**
    - Expand on in Pipeline Discussion
  - Upload scripts through Web Interface
  - Edit script in Web Interface to add description
  - Look at history
  - Look at history and blame report ofr bigger file: <https://github.com/kubernetes/kubernetes/blob/master/build/make-build-image.sh>
- Resources:
  - [Github Hellow Word](https://guides.github.com/activities/hello-world/)
  - [Git Flow](https://guides.github.com/introduction/flow/)

<!--v-->

## Step 2: Version Control

![Github Home](dev-tooling-for-ops/github-home.png)

Note:

Backup - Github Walk-through

<!--v-->

## Step 2: Version Control

![Github Signup](dev-tooling-for-ops/github-signup.png)

Note:

Backup - Github Walk-through - signup

<!--v-->

## Step 2: Version Control

![Git Create Repo 1](dev-tooling-for-ops/github-createrepo1.png)

<!--v-->

## Step 2: Version Control

![Git Create Repo 2](dev-tooling-for-ops/github-createrepo2.png)

<!--v-->

## Step 2: Version Control

![Git Upload File 1](dev-tooling-for-ops/github-upload1.png)

<!--v-->

## Step 2: Version Control

![Git Upload File 1](dev-tooling-for-ops/github-upload2.png)

<!--v-->

## Step 2: Version Control

![Git Blame Example](dev-tooling-for-ops/github-blame.png)


<!--s-->

## Step 3: Pipelines for Your Scripts

- Add intelligence to your repo
  - Testing
  - Implementation
  - Security Scanning

Note:

HANDSON: Gitlab Actions walk-through
Once you are used to using a repo with your code, take advantage of pipelines to help automatically test and deploy your code.

- Only looking at some testing
- Deployment a larger subject
- Security Scanning!  Bring up supply chain attacks
  - [GitGuardian](https://www.gitguardian.com/) - Free for public/open source repos.  SaaS to scan for credentials being committed
- [SuperLinter tutorial](https://docs.github.com/en/actions/quickstart)
  - Commit to main branch (although PR could be more appropriate for larger installs)
  - Wait for Output (or step ahead for screenshot below)
  - If time, submit PR to fix errors, view output
  - And use PR as opportunity to demo how Pull Requests work, with Peer Reviews

<!--v-->

## Step 3: Pipelines for Your Scripts

Create workflow configuration - Github's "Super Linter"

![Pipeline Configuration](dev-tooling-for-ops/pipeline1.png)

<!--v-->

## Step 3: Pipelines for Your Scripts

Runs on commits

![Pipeline Running](dev-tooling-for-ops/pipeline2.png)

<!--v-->

## Step 3: Pipelines for Your Scripts

Error

![Pipeline Error](dev-tooling-for-ops/pipeline3-error.png)

<!--v-->

## Step 3: Pipelines for Your Scripts

Adding

<!--s-->
## Conclusion

- Big Steps
  - Reduce toil by developing code
  - Put Code into version control
  - Develop pipelines and review processes to make code better
- Assist in:
  - Uptime - more automation and repeatable processes
  - Documentation: source code itself, along with other artifact, can serve as an important

<!--v-->

## Conclusion

- Taking it Further
  - IDE Environments (Visual Studio Code)
  - Infrastructure as Code (IaC)
  - Configuration Management
  - Gitops/Kubernetes

Note:

- IDE
  - Visual Studio Code
  - Probably do not want to manually upload/edit on web interface
  - VSCode is extremely popular in the lightweight IDE category
- Iac Frameworks
  - Useful for more cloud-based architectures
  - Terraform (probably biggest)
  - Pulumi
- Configuration Management
  - Useful for more traditional infrastructure.  In order of my preference
    - Ansible
    - Salt
    - Chef
    - Puppet
- GitOps/Kubernetes
  - More for Microservice styled architectures - but worthy of it's own discussion

<!--s-->

## Thank You

<https://present.r15cookie.com>

<https://www.r15cookie.com>

<!--v-->

## Additioanl Resources

- Ansible
  - [Redhat's Ansible Quickstart Guide](https://www.redhat.com/sysadmin/ansible-quick-start)
- Github
  - [Guides](https://guides.github.com/)
  - [Docs](https://docs.github.com/en)
  - [Oh Shit, Git!?!](https://ohshitgit.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- Google SRE Books
  - [Site Reliability Engineering](https://sre.google/sre-book/table-of-contents/)
  - [Site Reliability Workbook](https://sre.google/workbook/table-of-contents/)
  - [Building Reliable and Secure Systems (PDF)](https://static.googleusercontent.com/media/sre.google/en//static/pdf/building_secure_and_reliable_systems.pdf)