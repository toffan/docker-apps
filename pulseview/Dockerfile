FROM toffan/archlinux

ARG UID
ARG GID
ARG USERNAME=sigrok

ADD build.sh /build/
RUN /build/build.sh && rm -rf /build/

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT ["/usr/bin/pulseview"]
