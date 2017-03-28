FROM toffan/archlinux

ARG UID=1000
ARG GID=100
ARG USERNAME=sigrok

ADD build.sh /build/
RUN /build/build.sh && rm -rf /build/

VOLUME "/home/${USERNAME}/shared"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT sigrok-cli
