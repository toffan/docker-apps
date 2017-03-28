FROM base/archlinux

ADD build.sh makepkg.patch /build/
RUN /build/build.sh && rm -rf /build/
