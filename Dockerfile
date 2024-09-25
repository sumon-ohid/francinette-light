FROM debian:latest

LABEL made by = "xicodomingues and WaRtr0"
LABEL modified by = "msumon"
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
RUN apt install python3-dev python3-venv python3-wheel -y
RUN pip3 install wheel
RUN python3 -m venv venv
RUN . venv/bin/activate
WORKDIR /francinette
RUN pip3 install -r requirements.txt
RUN pip3 install norminette
RUN chmod 777 tester.sh
CMD ["/francinette/tester.sh"]
