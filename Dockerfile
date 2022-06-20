FROM homebrew/brew:latest
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1
