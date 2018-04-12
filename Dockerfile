FROM debian:sid-20180213

RUN echo 'deb-src http://deb.debian.org/debian sid main' >> /etc/apt/sources.list

# Install dependencies for build squid3
RUN apt-get update \
 && apt-get install -y libssl1.0-dev ca-certificates git-core fakeroot \
 && apt-get build-dep -y squid3

# Install golang
RUN apt-get install -y golang-go

# Config golang environment
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Setup release's scrpit 
COPY release.sh /release.sh
RUN chmod +x /release.sh

