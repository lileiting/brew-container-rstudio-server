FROM homebrew/brew:latest
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN chmod -R o+rx /home/linuxbrew

USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone

RUN apt-get update -qq -y
RUN apt-get install --no-install-recommends software-properties-common dirmngr -y
RUN curl -o- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" 
RUN apt-get install --no-install-recommends r-base -y
RUN apt-get install gdebi-core -y
RUN apt-get install lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-14-dev libclang-common-14-dev libclang-dev libclang1-14 libgc1 libllvm14 libobjc-11-dev libobjc4 libpq5 libssl-dev psmisc -y
RUN curl -O https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.1-554-amd64.deb
RUN gdebi -n rstudio-server-2022.07.1-554-amd64.deb
RUN rm rstudio-server-2022.07.1-554-amd64.deb

USER linuxbrew
