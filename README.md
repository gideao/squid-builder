# A builder for Squid
Use Jenkins and Docker for build Debian packages of Squid proxy.

The docker image contains all dependencies to build the packages. It is made using the 'Dockerfile' here.

After build it will try upload files created to Github. Edit release.sh to customize it with your repository.