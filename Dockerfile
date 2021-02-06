FROM quay.io/ssmiller25/reveal-md:latest

ARG GIT_HASH
ARG VERSION
ARG RELEASE_DATE


COPY css/ /slides/css/
COPY template/ /slides/template/
COPY presentations/. /slides/

EXPOSE 1948

LABEL maintainer="Steve Miller <me@r15cookie.com>"
LABEL version="${VERSION}"
LABEL git_hash="${GIT_HASH}"
LABEL release-date="${RELEASE_DATE}"