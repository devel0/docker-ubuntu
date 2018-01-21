FROM ubuntu:xenial

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# basic utils
RUN apt-get update && \
	apt-get install -y apt-utils apt-transport-https sudo curl wget gettext syslinux-utils bc jq man-db && \
	apt-get install -y git ntpdate ntp supervisor cron rsyslog nano net-tools inetutils-ping telnet mc rsync dnsutils iproute2 psmisc acl systemd

# node
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

# build
RUN apt-get install -y build-essential

# setup
RUN echo 'alias cp="cp -i"' >> /root/.bashrc && \
	echo 'alias mv="mv -i"' >> /root/.bashrc && \
	echo 'alias rm="rm -i"' >> /root/.bashrc && \
	echo 'HISTORY=1000000' >> /root/.bashrc && \
	echo 'PS1="[docker \h:\\w]\\\\$ "' >> /root/.bashrc && \
        echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then . /etc/bash_completion; fi' >> /root/.bashrc && \
        echo '"\e[1;5D": backward-word' >> /root/.inputrc && \
        echo '"\e[1;5C": forward-word' >> /root/.inputrc && \
        echo "source /etc/environment" >> /root/.bashrc

# entrypoint & cmd
RUN mkdir /entrypoint.d
COPY run-entrypoints.sh /root
ENTRYPOINT [ "/root/run-entrypoints.sh" ]
CMD /bin/bash
