# Prepare source code.
FROM ea31337/ea-tester:dev as ea31337-src
MAINTAINER kenorb
# Adjust the user's UID.
ARG UID=1000
USER root
RUN usermod -u $UID ubuntu
# Copy EA files.
USER ubuntu
COPY --chown=ubuntu:root src /opt/src
