FROM debian:latest

RUN apt update -y
RUN apt install git -y
RUN apt install zsh -y

# Set zsh as the default shell for the Docker container
RUN ln -sf /bin/zsh /bin/sh

RUN mkdir -p /home/libft
WORKDIR /home/libft

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
        libbsd-dev \
        python3 \
        python3-pip \
        python3-venv \
        python3-dev \
        python3-setuptools \
        python3-wheel \
        pipx \
        clang \
        valgrind \
        gcc \
        lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pipx install norminette && \
    pipx ensurepath

RUN mkdir -p /francinette
COPY libft /home/libft

COPY install.sh /francinette/bin/install.sh

RUN chmod +x /francinette/bin/install.sh

# Keep the container running
ENTRYPOINT [ "sh", "-c", "/francinette/bin/install.sh && exec sh" ]