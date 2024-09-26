FROM debian:latest

LABEL made_by="xicodomingues and WaRtr0"
LABEL modified_by="msumon"
LABEL maintainer="msumon@student.42vienna.com"
LABEL version="1.0.0"
LABEL description="francinette light 42vienna"

RUN apt update -y
RUN apt install git -y
WORKDIR /
RUN git clone --recursive https://github.com/xicodomingues/francinette.git
RUN apt update -y
RUN apt upgrade -y
RUN apt install gcc clang libpq-dev libbsd-dev libncurses-dev valgrind build-essential nasm clang ghc cmake make libxext-dev libbsd-dev libpq-dev -y
RUN apt install python3-dev python3-pip -y
RUN apt install python3-venv python3-wheel -y

# Create and activate virtual environment, then install packages
WORKDIR /francinette
RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate && pip install --upgrade pip setuptools && pip install -r requirements.txt && pip install norminette"

RUN chmod 777 tester.sh
CMD ["/francinette/tester.sh"]