FROM debian

ARG UID=1000
ARG GID=100
ARG USERNAME=discord
ARG VERSION=0.0.15

ADD build.sh /build/
RUN /build/build.sh

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"
VOLUME "/home/${USERNAME}/.config/discordcanary"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT ["/usr/bin/discord-canary"]
