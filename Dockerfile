ARG GIT_HASH
ARG VERSION
ARG RELEASE_DATE
ARG REVEAL_VERSION

FROM quay.io/ssmiller25/reveal-md:${REVEAL_VERSION}


COPY css/ /slides/css/
COPY template/ /slides/template/
COPY presentations/. /slides/

EXPOSE 1948

LABEL maintainer="Steve Miller <me@r15cookie.com>"
LABEL version="${VERSION}"
LABEL git_hash="${GIT_HASH}"
LABEL release-date="${RELEASE_DATE}"