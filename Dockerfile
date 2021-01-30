FROM quay.io/ssmiller25/reveal-md:latest

# set version label
ARG GIT_HASH
ARG VERSION
ARG RELEASE_DATE
LABEL maintainer="Steve Miller <me@r15cookie.com>"
LABEL version="${VERSION}"
LABEL git_hash="${GIT_HASH}"
LABEL release-date="${RELEASE_DATE}"

COPY *.png /slides/
COPY k8s-intro-dev.md /slides/
COPY k8s-intro-ops.md /slides/

EXPOSE 1948

