FROM agiled/reveal.js-docker
RUN mkdir -p /revealjs/presentations
COPY k8s-intro-dev.md /slides/index.md
RUN pandoc -t revealjs -s -o /slides/index.html < /slides/index.md
RUN rm /slides/index.md
