FROM debian:testing-slim

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		glusterfs-server \
		tini \
	&& apt-get autoremove \
	&& apt-get autoclean \
	&& rm -r /var/lib/apt

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/glusterd", "-N", "-l", "/dev/stdout"]