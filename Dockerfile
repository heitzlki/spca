FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    gdb \
    sudo \
    vim \
    libxtst6 \
    libglib2.0-0 \
    libsm6 \
    libxi6 \
    libxrender1 \
    libxrandr2 \
    libfreetype6 \
    libfontconfig \
    lsb-release \
    valgrind \
    git

RUN adduser --disabled-password --gecos '' user &&\
    usermod -aG sudo user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sudo apt install man-db -y
RUN yes | sudo unminimize

USER user
WORKDIR /home/user
ENV HOME=/home/user

CMD ["bash"]
