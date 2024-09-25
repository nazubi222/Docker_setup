
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    python3 \
    python-is-python3 \
    libc6-i386 \
    nano\
    && apt-get clean


RUN mkdir -p /app

RUN git clone --recursive https://github.com/openshwprojects/OpenBK7231N \
    && git clone --recursive https://github.com/openshwprojects/OpenBK7231T \
    && git clone https://github.com/openshwprojects/OpenBK7231T_App.git \
    && cp -r OpenBK7231T_App/OpenBK7231T_App OpenBK7231N/apps/OpenBK7231N_App \
    && cp -r OpenBK7231T_App/OpenBK7231T_App OpenBK7231T/apps/OpenBK7231T_App

COPY ./script/* /app/OpenBK7231N/
COPY ./script/* /app/OpenBK7231T/

VOLUME ["/app"]

WORKDIR /app

CMD ["bash"]

#docker volume create my-volume
#docker run --name my-container -v my-volume:/app -it my-image
