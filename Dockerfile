FROM ubuntu:latest
LABEL authors="lidor-bashari"

ENTRYPOINT ["top", "-b"]