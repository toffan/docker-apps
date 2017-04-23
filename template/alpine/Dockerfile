FROM alpine

ARG UID
ARG GID
ARG USERNAME=

ADD build.sh /build/
RUN /build/build.sh

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT [""]
