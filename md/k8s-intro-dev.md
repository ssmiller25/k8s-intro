---
theme : "night"
#theme : "beige"
transition: "slide"
highlightTheme: "monokai"
logoImg: "logo.png"
slideNumber: true
title: "What is Kubernetes and How do I Get Started?"
revealOptions:
    transition: 'zoom'
---

# What is Kubernetes and How do I Get Started?

 [Steve Miller](https://www.r15cookie.com) - Site Reliability Engineer

---

## What Is Kubernetes!

<aside class="notes">
  5 min

  A (air-quote)"better" way to run applications.  A series of abstractions that let me run code in a consistent manner across several type  of infrastructure.

  Microservice architecture

  Need to coordinate all these services...which is what Kubernetes is all about.
</aside>

---

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

---

## Step 1: Install Docker Desktop

Kubernetes Included (optionally)!

<aside class="notes">
    3 min...just shoinwing screenshots of installation/config on mac/windows
    Go over basics of containers...follow downward if we need to dig into further

    Mention could be anything that build docker containers...docker open source, or OCI compabile software like buildah
</aside>

---

## Step 2: Containerize My Java App!

```
FROM openjdk:8-jre
ADD target/shopfront-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8010
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
```


<aside class="notes">
    Time: 10 min
    Take existing Springboot app, buildable by Maven, and show with example of build.
    Manually run docker container on it's own.
    But...why is this important?
</aside>

--

## Docker Builds

Use docker to build AND package app.

<aside class="notes">
  TODO: Repo with build information
</aside>


---

## Step 3: Get it in Kubernetes!

<aside class="notes">
    Time: 10 min
    Show deployment of container in Kubernetes.  Not sure if I want to do straight kubectl command, or perhaps show off some yaml
    Also, make note that this is NOT how you generally would deploy in production

    Just demo with "port-forward"...then expose later to world!
</aside>

--

## Deployment

--

## Pod

--

## Service

--

## Ingress

--

## Operators and CRDs

---

## Step 4: Orchestrate Some Microservices!

<aside class="notes">
  Time: 10 min
  Demonstrate multiple micro-apps in kubernertes
  Demonstrate Ingress, and exposing to outside world
</aside>

--

## Java Considerations

Memory

<aside class="notes">
  Docker container and JVM, by default, will see entire memory of machine!
  https://jaxenter.com/nobody-puts-java-container-139373.html
    JDK 9 or greater
    Specifically the following JVM options: -XX:+UseCGroupMemoryLimitForHeap
    -XX:+UnlockExperimentalVMOptions

</aside>

---

## What Does Kubernetes Get Me?

Your app just needs to worry about it's function.  Seperate functions can be configured to handle:
* URL Routing
* TLS Termination
* Authentication
* Metrics, Logging, Healthchecks
* Rollbacks


<aside class="notes">
  Time: 5 min
  Step back...what does this buy me as a developer
</aside>

---

### Kubernetes and Microservice Downsides

  * Downsides of Microservices in General
  * Distributed Tracing
  * A Fluid Environment 

![CNCF Landscape](cncf-landscape.png)

<aside class="notes">
  Time: 5 min, including solutions

  * Downsides of Microservices
    * How to segment services
    * Debugging a Distributed System
    * Testing
</aside>

--

## Solutions

  * Microservices: Rapid development, 
  * Visibility: OpenTelemetry, Airbrake, etc.
  * [KubeProd](https://kubeprod.io/): Bitami service to lay out a lot of the good initial infrastructure. 

<aside class="notes">
  Recomment "looking" at Kubeprod, but deploying individual services yourself as necessary.
</aside>



---


## Resources

  * Digital Ocean [Kubernetes for Full Stack Developers](https://www.digitalocean.com/community/curriculums/kubernetes-for-full-stack-developers)
  * Aqua Security [Kubernetes 101](https://www.aquasec.com/resources/kubernetes-101/)
  * Oreilly's Designing Distributed Systems
  * The DevOps Handbook (Companion ot the Phoenix Project) 
  * [Hipster Shop](https://github.com/GoogleCloudPlatform/microservices-demo)

--

## Resources - CKA Exam
  * CKA Exam
    * https://www.contino.io/insights/the-ultimate-guide-to-passing-the-cka-exam 
    * https://github.com/cncf/curriculum
    * https://www.katacoda.com/courses/kubernetes/playground 
    * https://blog.autsoft.hu/certified-kubernetes-administrator/


<aside class="notes">
  TODO: Gather resourcss for the developer certification
</aside>
--

## Sources

[Managing Kubernetes Containers in Docker](https://www.oreilly.com/content/how-to-manage-docker-containers-in-kubernetes-with-java/)
[Oreilly Java Shoppint App](https://github.com/danielbryantuk/oreilly-docker-java-shopping/)
