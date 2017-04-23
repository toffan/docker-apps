FROM debian

ARG UID
ARG GID
ARG USERNAME=discord
ARG VERSION

ADD build.sh /build/
RUN /build/build.sh

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"
VOLUME "/home/${USERNAME}/.config/discordcanary"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT ["/usr/bin/discord-canary"]
