FROM rocker/r-base
MAINTAINER Kevin Son <eunwoo.son@sdstate.edu>

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN R -e 'install.packages(c("devtools"))'
RUN R -e 'devtools::install_github("trestletech/plumber")'

COPY ./ /usr/local/src/plumber/
WORKDIR /usr/local/src/plumber/
VOLUME /usr/local/src/plumber/

EXPOSE 8000
CMD ["Rscript", "/lib.R"]
CMD ["Rscript", "/runServer.R"]