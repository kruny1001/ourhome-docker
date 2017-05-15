FROM rocker/r-base
MAINTAINER Kevin Son <eunwoo.son@sdstate.edu>

RUN wget -P /etc/yum.repos.d/ https://copr.fedoraproject.org/coprs/petersen/pandoc-el5/repo/epel-5/petersen-pandoc-el5-epel-5.repo
RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  pandoc \
  pandoc-citeproc

RUN R -e 'install.packages(c("devtools"))'
RUN R -e 'devtools::install_github("trestletech/plumber")'

COPY ./ /usr/local/src/plumber/
WORKDIR /usr/local/src/plumber/
VOLUME /usr/local/src/plumber/

EXPOSE 8080
CMD ["Rscript", "./lib.R"]
CMD ["Rscript", "./runServer.R"]
