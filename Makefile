DISCORD_VERSION=0.0.15
ROCKETCHAT_VERSION=2.6.1

UID="$(shell id -u)"
GID="$(shell id -g)"
BUILD_ARGS=--build-arg UID=$(UID) --build-arg GID=$(GID)

all: discord gimp grip nginx-dir poezio pulseview rocketchat sigrok-cli
.PHONY: all

alpine:
	docker pull alpine

archlinux:
	docker pull base/archlinux
	docker build $(BUILD_ARGS) -t toffan/archlinux archlinux

debian:
	docker pull debian

discord: debian
	docker build $(BUILD_ARGS) --build-arg VERSION=$(DISCORD_VERSION) -t toffan/discord discord

gimp: alpine
	docker build $(BUILD_ARGS) -t toffan/gimp gimp

grip: alpine
	docker build $(BUILD_ARGS) -t toffan/grip grip

nginx:
	docker pull nginx:alpine

nginx-dir: nginx
	docker build $(BUILD_ARGS) -t toffan/nginx-dir nginx-dir

poezio: alpine
	docker build $(BUILD_ARGS) -t toffan/poezio poezio

pulseview: archlinux
	docker build $(BUILD_ARGS) -t toffan/pulseview pulseview

rocketchat: debian
	docker build $(BUILD_ARGS) --build-arg VERSION=$(ROCKETCHAT_VERSION) -t toffan/rocketchat rocketchat

sigrok-cli: archlinux
	docker build $(BUILD_ARGS) -t toffan/sigrok-cli

