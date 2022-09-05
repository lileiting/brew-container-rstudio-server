FROM homebrew/brew:latest
RUN chmod -R o+rx /home/linuxbrew

### https://www.rstudio.com/products/rstudio/download-server/debian-ubuntu/
USER root
RUN apt-get update -qq -y && \
    apt-get install gdebi-core -y && \
    apt-get install lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-14-dev libclang-common-14-dev \
                    libclang-dev libclang1-14 libgc1 libllvm14 libobjc-11-dev libobjc4 libpq5 \
                    libssl-dev psmisc -y && \
    curl -O https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.1-554-amd64.deb && \
    gdebi -n rstudio-server-2022.07.1-554-amd64.deb && \
    rm rstudio-server-2022.07.1-554-amd64.deb
USER linuxbrew
