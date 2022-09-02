FROM homebrew/brew:latest
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
RUN apt-get update -qq -y
RUN apt-get install --no-install-recommends software-properties-common dirmngr -y
RUN curl -o- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" 
RUN apt-get install --no-install-recommends r-base -y
RUN apt-get install gdebi-core -y
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.1-554-amd64.deb
RUN gdebi rstudio-server-2022.07.1-554-amd64.deb
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN chmod -R o+rx /home/linuxbrew
