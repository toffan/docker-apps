FROM alpine

ARG UID=1000
ARG GID=100
ARG USERNAME=gimp

ADD build.sh /build/
RUN /build/build.sh && rm -rf /build/

VOLUME /tmp/.X11-unix
VOLUME "/home/${USERNAME}/shared"
VOLUME "/home/${USERNAME}/.gimp-2.8"

USER "$USERNAME"
WORKDIR "/home/${USERNAME}"
ADD .gtkrc-2.0 ./

ENTRYPOINT gimp
