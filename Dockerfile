FROM fedora:latest

COPY core /core

RUN dnf install bzflag -y

ENTRYPOINT ["bzfs", "-conf"]
