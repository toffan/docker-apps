all: gimp grip nginx-dir poezio pulseview rocketchat sigrok-cli
.PHONY: all

alpine:
	docker pull alpine

archlinux:
	docker pull base/archlinux
	docker build -t toffan/archlinux archlinux

debian:
	docker pull debian

gimp: alpine
	docker build -t toffan/gimp gimp

grip: alpine
	docker build -t toffan/grip grip

nginx:
	docker pull nginx:alpine

nginx-dir: nginx
	docker build -t toffan/nginx-dir nginx-dir

poezio: alpine
	docker build -t toffan/poezio poezio

pulseview: archlinux
	docker build -t toffan/pulseview pulseview

rocketchat: debian
	docker build -t toffan/rocketchat rocketchat

sigrok-cli: archlinux
	docker build -t toffan/sigrok-cli

