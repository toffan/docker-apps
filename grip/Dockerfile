FROM alpine

ARG UID
ARG GID
ARG USERNAME=grip

ADD build.sh /build/
ADD wrapper /usr/local/bin/
RUN /build/build.sh

VOLUME "/home/${USERNAME}/shared/"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}/shared/"
EXPOSE 6419

ENTRYPOINT ["/usr/local/bin/wrapper"]
