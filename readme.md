docker run -d -p 80:8080 -v $(pwd):/usr/local/src/plumber ourhome-report
wget -P /etc/yum.repos.d/ https://copr.fedoraproject.org/coprs/petersen/pandoc-el5/repo/epel-5/petersen-pandoc-el5-epel-5.repo
apt-get install pandoc pandoc-citeproc
