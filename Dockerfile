FROM debian:stretch
MAINTAINER Medieval <support@medievalwp.com>

RUN apt-get update \
  && apt-get install -y \
  php-cli \
  libjson-webtoken-perl \
  libauthen-ntlm-perl \
  libcgi-pm-perl \
  libcrypt-openssl-rsa-perl \
  libdata-uniqid-perl \
  libfile-copy-recursive-perl \
  libio-socket-ssl-perl \
  libio-socket-inet6-perl \
  libio-tee-perl \
  libhtml-parser-perl \
  libjson-webtoken-perl \
  libmail-imapclient-perl \
  libparse-recdescent-perl \
  libmodule-scandeps-perl \
  libpar-packer-perl \
  libreadonly-perl \
  libsys-meminfo-perl \
  libterm-readkey-perl \
  libtest-mockobject-perl \
  libtest-pod-perl \
  libunicode-string-perl \
  liburi-perl  \
  libwww-perl \
  procps \
  wget \
  nano \
  && rm -rf /var/lib/apt/lists/*

RUN wget -N https://imapsync.lamiral.info/imapsync \
  && cp imapsync /usr/bin/imapsync \
  && chmod +x /usr/bin/imapsync

ADD entrypoint.sh /entrypoint.sh
ADD sync.php /sync.php


#USER nobody
#VOLUME /data
#WORKDIR /data

CMD ["/bin/bash", "/entrypoint.sh"]

#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["noop"]


# End of imapsync Dockerfile