---
theme : "beige"
transition: "slide"
highlightTheme: "monokai"
logoImg: "logo.png"
slideNumber: true
title: "VSCode Reveal intro"
separator: <!--s-->
verticalSeparator: <!--v-->
revealOptions:
    transition: 'zoom'
---

# Kubernetes!

 [Steve Miller](https://www.r15cookie.com) - Devops Practioner

 <!--s-->

## Goal

Cover the essential steps to run an application in Kubernetes

<aside class="notes">
  Might want to emphasis not necessarily production, or automated...but at least steps are there.
  Questions to ask audience to taylor presentation:
    * What does everyone do.  Developers/Operations/DevOps
    * Have many people of used docker?  Dockerized an app?
    * Exposure to Kubernetes?
</aside>

 <!--s-->

## What Is Kubernetes?

<aside class="notes">
  5 min

  A (air-quote)"better" way to run applications.  A series of abstractions that let me run code in a consistent manner across several type  of infrastructure.

  Microservice architecture

  Need to coordinate all these services...which is what Kubernetes is all about.
</aside>

 <!--s-->

## Containers

Containers: a really, really fancy way to isolate and configure running processes.

**Docker**...and others...

<aside class="notes">
    5 min
    Containers: The core building blocks
    Containers -> a really, really fancy way to isolate and configure running programs.

    Generally run in their own isolated filesystem, isolated process namespace, and isolated network

    But...beware security, as depending on infrastructure and configuration, but not be as isolated as one would hope.
</aside>

 <!--s-->

## Step 1: Install Docker Desktop

Kubernetes Included (optionally)

![Enable Kubernetes Dialog](settings-kubernetes.png)

<aside class="notes">
    3 min...just showing screenshots of installation/config on mac/windows
    Go over basics of containers...follow downward if we need to dig into further

    Docker for desktop is probably the easiest option for Windows and Mac, but many others exist:
      * Minikube: Probably the most popular outside of Docker for Desktop (or more popular, but not QUITE as integrated)
      * Micro.k8s: A Canonical offering, supports Linux, Mac, and Windows
      * kind: Kubernetes in Docker.  Still need docker, but can do multi-"hosts" if you want to simulate a cluster.

    Mention could be anything that build docker containers...docker open source, or OCI compatible software like buildah
</aside>

<!--s-->

## Step 2: Containerize An App

Let's say...this presentation


<aside class="notes">
    Time: 10 min

</aside>

<!--v-->

## Simple Docker Build

```Dockerfile
FROM webpronl/reveal-md:latest
COPY *.png /slides/
COPY k8s-intro-dev.md /slides/

EXPOSE 1948
```

From <https://github.com/ssmiller25/k8s-intro/blob/master/Dockerfile>


<aside class="notes">
  Lines of Docker File
    * FROM - base image.  Talk about trusted base images
    * COPY - add file to the image (also can use ADD keyword, which supports URLs and untaring directly)
    * EXPOSE - exposed port...more important if just running in docker itself
    * ENTRYPOINT - Command to run when starting docker container (not in this example, but show off looking
      up base container)

</aside>

<!--v-->

Testing out

```sh
docker build . -t ssmiller25/k8s-intro:latest
docker run -d --rm -p 1948:1948 ssmiller25/k8s-intro:latest
```

Also see https://github.com/ssmiller25/k8s-intro/blob/master/Makefile 

<aside class="notes">
  Mention Makefile with more details
  * Build: will look for dockerfile and run
  * Docker run flogs to point out
    * -d: in background
    * --rm: remove after stopping
    * -p: expose a port externally
</aside>

<!--s-->

## Step 3: Get it in Kubernetes!

<aside class="notes">
  Use https://github.com/ssmiller25/k8s-intro/tree/master/deploy-manual
  with example command, to deploy this into Kubernetes
</aside>

<!--v-->

## Essential Components in Kubernetes

Kubernetes constructs:

* Pod
* Deployment: Manages Pods
* Service: Exposes pod(s)
* Ingress: More sophisticated way to expose an application

<aside class="notes>
  With all three containers created:
  * Create deployment
  * Show pods created.  Use port-forward to demo that pod is listening
  * Create service for all three "applications"
  * Create an ingress to expose front end
  * Demo fully operational app
  * Demo deleted a pod, and deployment recreating
</aside>


<!--s-->

## Microservice Application

![Microservice Overview](microarch.png)

<span style="font-size:12pt;">Source: Bryant, Daniel. (2017). Containerizing Continuous Delivery in Java.</span>

<aside class="notes">
    Time: 10 min
    Show deployment of container in Kubernetes.  Not sure if I want to do straight kubectl command, or perhaps show off some yaml
    Also, make note that this is NOT how you generally would deploy in production

    Take existing Spring Boot app, build-able by Maven, and show with example of build.
    Original: https://github.com/danielbryantuk/oreilly-docker-java-shopping/
    Customized for this presentation: https://github.com/danielbryantuk/oreilly-docker-java-shopping/ (Apache 2.0 license, so good for modification.)

    Manually run docker container on it's own.
    Discuss assumptions...
    But...why is this important?

</aside>

<!--v-->

## Docker Builds

Use docker to build AND package app.

```Dockerfile
FROM maven:3-jdk-8 as builder
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean install
FROM openjdk:8-jre 
COPY --from=builder /tmp/target/shopfront-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8010
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
```

Full Repo: <https://github.com/ssmiller25/oreilly-docker-java-shopping>

<aside class="notes">
  TODO: Slightly modified with Maven build, as well as layered containers.

  Additional Lines
  * FROM ... AS : Allow reference for multi-stage build
  * RUN : Run command within docker, creating new layer
  * COPY --from=builder : Move files from previous build
</aside>



<!--v-->

## 12-factor App

Not required, but super helpful
[https://12factor.net/](https://12factor.net/)

<aside class="notes">
  One of the keys to understanding Microservice architecture...and k8s overall
  #3: Store configs in environment
  #6: Stateless processes
  #9: Disposability
</aside>

<!--v-->

## Remember...Don't Treat Containers like VMs

* Should be disposable and horizontally scalable.
* Avoid persistent data on the container *

<sub>* Under most circumstances...</sub>

<aside class="notes">
  Kuberentes has no concept of "migrating" containers.  For instance, if an individual host is killed off,
  k8s will simple spin up a new container.

  Discuss persistent data on containers, and k8s overall
</aside>

<!--v-->

## Design Patterns!

* O'Reilly's Designing Distributed Systems book
* Microsoft [Design Pattern Page](https://docs.microsoft.com/en-us/azure/architecture/patterns/): A bit Azure focused, but mostly useful across cloud providers/on-prem

<!--s-->

## Step 4: Orchestrate Some Microservices!

<aside class="notes">
  Time: 10 min
  Demonstrate multiple micro-apps in kubernertes
  Demonstrate Ingress, and exposing to outside world
</aside>

<!--v-->

## Deployments/Pods/Services

<aside class="notes">
  Directly kubectl commands to create all three deployments, and services for each
  Demo deleted a pod, and watching it be recreated
  kubectl port-forward to see service
</aside>

<!--v-->

## Ingress

<aside class="notes">
  Create ingress to expose service to outside world.  Demo with web browser
</aside>

<!--v-->

## Deployment In Real Life

<aside class="notes">
  More difficult.  Some strategies
  * Export yaml files, build pipeline to apply after push to "production".  Also combined with kustomize.
  * Helm
  * K8S Native CI/CD tools: ArgoCD, Tekton, JenkinsX (Is JenkinsX really k8s native...maybe with the Jenkins Operator...)
  * Flux 
</aside>

<!--s-->

## What Does Kubernetes Get Me?

Your app just needs to worry about it's function.  Separate functions can be configured to handle:

* Load balancing
* Health checks and automatic application restarts
* Deployment and Rollback
* URL Routing
* TLS Termination
* Authentication
* Metrics, Logging, Health Checks

<aside class="notes">
  Time: 5 min
  Step back...what does this buy me as a developer
</aside>

<!--s-->

### Kubernetes and Microservice Downsides

* Downsides of Microservices in General
  * Management of complexity with larger deployments
  * Observability
  * Ad-hoc debugging ability
* A Fluid Environment

![CNCF Landscape](cncf-landscape.png)

<aside class="notes">
Time: 5 min, including solutions

* Downsides of Microservices
  * How to segment services
  * Debugging a Distributed System
  * Testing
* k8s itself is a complex environment

</aside>

<!--v-->

## Solutions

* Management of complexity: Rapid development, testing
* Observability: OpenTelemetry, Airbrake, etc. 
* Ad hoc debugging: Sysdig, `kubectl exec ... sh`, Sidecar container [kubectl-debug](https://github.com/aylei/kubectl-debug)
* K8S complexity: [KubeProd](https://kubeprod.io/) as a good starting point.   

<aside class="notes">
  Recommend "looking" at Kubeprod, but deploying individual services yourself as necessary.
</aside>

<!--v-->

## Places to Host Kubernetes 

* Big Cloud Providers( **Google Cloud GKE**, AWS EKS, Azure AKS)
* From https://free-for.dev/ (Below are Kubernetes Namespace as a Service)
  * https://kubesail.com/  1 Core of CPU, 512MB of RAM, 100MB of storage and 1 domain
  * https://k8spin.cloud/  100 mCore of CPU, 128MB of RAM.
  * https://okteto.com/  Three namespaces, each with 8GB of RAM, 4 CPUs and 150GB Disk space.

<aside class="notes">
  * GKE not bad, assuming you use preemtable instances...and DON'T use their load balancer/ingress that will run $20/month
  * Free for dev services I've only lightly tested.  All integrate with github for authentication:
    * kubesail.com: Seems solid., two level upgrade path ($7/month, and a $25/month)
    * k8spin.cloud: Super easy entry (can tie to Github account).  Although console was unavailable at times
    * okteto.com: Also super-easy setup.  Although generous resources, no upgrade path without going on-prep
</aside>

<!--s-->

## Thank You

<https://www.github.com/ssmiller25/k8s-intro>

<https://www.r15cookie.com>

<!--s-->

## Resources

* O'Reilly's Designing Distributed Systems
* Digital Ocean [Kubernetes for Full Stack Developers](https://www.digitalocean.com/community/curriculums/kubernetes-for-full-stack-developers)
* Aqua Security [Kubernetes 101](https://www.aquasec.com/resources/kubernetes-101/)
* The DevOps Handbook (Companion ot the Phoenix Project) 
* [Hipster Shop](https://github.com/GoogleCloudPlatform/microservices-demo)

<!--v-->

## Other Research Items to Pursue

* Skaffold
* Service Mesh: Istio or Linkerd
* gRPC
* ArgoCD or Tekton Pipelines
* Flux

<!--v-->

## Java Considerations

Memory

<aside class="notes">
  Docker container and JVM, by default, will see entire memory of machine!
  https://jaxenter.com/nobody-puts-java-container-139373.html
    JDK 9 or greater
    Specifically the following JVM options: -XX:+UseCGroupMemoryLimitForHeap
    -XX:+UnlockExperimentalVMOptions

</aside>

<!--v-->

## Resources - CKA Exam

* CKA Exam
  * https://www.contino.io/insights/the-ultimate-guide-to-passing-the-cka-exam 
  * https://github.com/cncf/curriculum
  * https://www.katacoda.com/courses/kubernetes/playground 
  * https://blog.autsoft.hu/certified-kubernetes-administrator/

<aside class="notes">
  TODO: Gather resourcss for the developer certification
</aside>

<!--v-->

## Sources

* [Managing Kubernetes Containers in Docker](https://www.oreilly.com/content/how-to-manage-docker-containers-in-kubernetes-with-java/)
  * Warning: Some references are a bit dated, but still a good book.  See the updates I made in my repo at [Oreilly](https://github.com/ssmiller25/oreilly-docker-java-shopping)
* [O'Reilly Java Shopping App](https://github.com/danielbryantuk/oreilly-docker-java-shopping/)