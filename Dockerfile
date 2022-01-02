FROM alpine:3.12 AS verify

ARG TARGETPLATFORM

RUN apk add --no-cache \
	curl \
	libarchive-tools

ADD download.sh .

RUN ./download.sh $TARGETPLATFORM

FROM scratch AS root
COPY --from=verify /rootfs/ /

ENV LANG=en_US.UTF-8
RUN ldconfig \
	&& locale-gen \
	&& pacman-key --init \
	&& pacman-key --populate archlinuxarm \
	&& pacman -Syu --noconfirm \
	&& pacman -Sc --noconfirm

CMD ["/usr/bin/bash"]
