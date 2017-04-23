FROM alpine

ARG UID
ARG GID
ARG USERNAME=poezio

ADD build.sh /build/
RUN /build/build.sh && rm -rf /build/

VOLUME "/home/${USERNAME}/.config/poezio"
VOLUME "/home/${USERNAME}/.local/share/poezio"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"

ENTRYPOINT ["/usr/bin/poezio"]
