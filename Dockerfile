FROM ubuntu:latest

ARG user=mi
ARG root=root
ARG password=123456
ARG ohmyzsh_url=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git

# update mirrors source
#RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && \
#    sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

# update and install
RUN apt-get update &&     \
    apt-get -y upgrade && \
    apt-get -y install sudo zsh apt-utils && \
    apt-get -y install git iputils-ping net-tools vim python3 curl

# add user and password
RUN useradd --create-home --shell /bin/zsh ${user}
RUN chown -R ${user}:${user} /home
RUN echo "${root}:${password}" | chpasswd
RUN echo "${user}:${password}" | chpasswd
RUN echo "${user} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ${user}

# prepare workspace
WORKDIR /home/${user}

# install ohmyzsh
RUN git clone ${ohmyzsh_url} &&                            \
    REMOTE=${ohmyzsh_url} sh ./ohmyzsh/tools/install.sh && \
    rm ./ohmyzsh -r
