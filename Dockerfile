FROM ubuntu:22.04

ARG user=mi
ARG password=123456
ARG ohmyzsh_url=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git

# update mirrors source
#RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && \
#    sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

# update
RUN apt-get update &&     \
    apt-get -y upgrade && \
    apt-get -y install sudo zsh apt-utils

# create mi user
RUN useradd --create-home --shell /bin/zsh ${user} && \
    echo "${user}:${password}" | chpasswd

# install software
RUN apt-get install -y git iputils-ping net-tools vim python3 curl

USER ${user}
WORKDIR /home/${user}

# install ohmyzsh
RUN git clone ${ohmyzsh_url} &&                            \
    REMOTE=${ohmyzsh_url} sh ./ohmyzsh/tools/install.sh && \
    rm ./ohmyzsh -r

# prepare workspace
RUN mkdir work
