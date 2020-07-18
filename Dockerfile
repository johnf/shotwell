FROM ubuntu:disco

# Update debian and install build tools
RUN apt-get -qq update && apt-get -qq upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y \
    build-essential \
    devscripts \
    equivs \
 && apt-get -qq autoremove -y && apt-get clean
# && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /

VOLUME ["/mnt/src"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["dpkg-buildpackage", "-us", "-uc"]
