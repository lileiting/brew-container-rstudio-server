FROM homebrew/brew:latest
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
RUN apt update -qq -y
RUN apt install --no-install-recommends software-properties-common dirmngr -y
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" 
RUN apt install --no-install-recommends r-base -y
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN chmod -R o+rx /home/linuxbrew
