---
theme : "night"
transition: "slide"
highlightTheme: "monokai"
logoImg: "logo.png"
slideNumber: false
title: "VSCode Reveal intro"
---

# Kubernetes!

 [Steve Miller](https://www.r15cookie.com) - Site Reliability Engineer

<small>Created by [](https://www.evilznet.com) / [@Evilznet](https://twitter.com/Evilznet)</small>

---

## What Is Kubernetes!

<aside class="notes">
    Container Orchestration Framework
</aside>

---

## Containers and Microservices...Oh My!

<aside class="notes">
    Go over basics of containers...follow downward if we need to dig into further
</aside>

---

## Step 1: Install Docker Desktop

Kubernetes Included (optionally)!

<aside class="notes">
    Go over basics of containers...follow downward if we need to dig into further
</aside>

---

## Step 2: Containerize My Java App!

<aside class="notes">
    Take existing Springboot app, buildable by Maven, and show with example of build.
    Manually run docker container on it's own.
    But...why is this important?
</aside>

--

## Container Getting Started

```
FROM openjdk:8-jre
ADD target/shopfront-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8010
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
```

--

## Docker Layering



---

## Step 3: Get it in Kubernetes!

<aside class="notes">
    Show deployment of container in Kubernetes.  Not sure if I want to do straight kubectl command, or perhaps show off some yaml
    Also, make note that this is NOT how you generally would deploy in production
</aside>

--

## Deployment

--

## Pod

--

## Service

-- 

## Ingress

---

## Step 4: Orchestrate Some Microservices!

--

## Java Considerations


Presentations look great on touch devices, like mobile phones and tablets. Simply swipe through your slides.

---

### Kubernetes and Microservice Downsides

  * Downsides of microservices in general
  * Distributed Tracing
  * A fluid environment 

![CNCF Landscape](cncf-landscape.png)
<aside class="notes">
  * Downsides of Microservices
    * How to segment services
    * Error handing of a particluar service is down
    * Testing
</aside>

--

## Mitigations

  * [KubeProd](https://kubeprod.io/): Bitami service to lay out a lot of the good initial infrastructure

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

## Sources

[Managing Kubernetes Containers in Docker](https://www.oreilly.com/content/how-to-manage-docker-containers-in-kubernetes-with-java/)
[Oreilly Java Shoppint App](https://github.com/danielbryantuk/oreilly-docker-java-shopping/)