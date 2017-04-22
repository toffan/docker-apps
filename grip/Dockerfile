FROM alpine

ARG UID=1000
ARG GID=100
ARG USERNAME=grip

ADD build.sh /build/
ADD wrapper /usr/local/bin/
RUN /build/build.sh && rm -rf /build/

VOLUME "/home/${USERNAME}/shared/"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}/shared/"
EXPOSE 6419

ENTRYPOINT ["/usr/local/bin/wrapper"]
