all: gimp nginx-dir poezio pulseview sigrok-cli
.PHONY: all

alpine:
	docker pull alpine

archlinux:
	docker pull base/archlinux
	docker build -t toffan/archlinux archlinux

gimp: alpine
	docker build -t toffan/gimp gimp

nginx:
	docker pull nginx:alpine

nginx-dir: nginx
	docker build -t toffan/nginx-dir nginx-dir

poezio: alpine
	docker build -t toffan/poezio poezio

pulseview: archlinux
	docker build -t toffan/pulseview pulseview

sigrok-cli: archlinux
	docker build -t toffan/sigrok-cli

