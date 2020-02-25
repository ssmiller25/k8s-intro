FROM agiled/reveal.js-docker
RUN apt-get update && apt-get -y install pandoc
RUN mkdir -p /revealjs/presentations
COPY k8s-intro-dev.md /revealjs/presentations/index.md
RUN pandoc -t revealjs -s -o /revealjs/presentations/index.html < /revealjs/presentations/index.md
