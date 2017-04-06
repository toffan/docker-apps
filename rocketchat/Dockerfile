FROM debian

ARG UID=1000
ARG GID=100
ARG USERNAME=rocketchat
ARG VERSION=2.6.1

ADD build.sh /build/
RUN /build/build.sh

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"
VOLUME "/home/${USERNAME}/.config/Rocket.Chat+"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT rocketchat
