FROM nginx:alpine

ARG USER
ARG TEST_SECRET
ARG abc
ARG LD_PRELOAD

RUN env | grep TEST_SECRET || true
RUN echo $TEST_SECRET || true

RUN env | grep abc || true
RUN echo $abc || true

RUN env | grep LD_PRELOAD || true
RUN echo $LD_PRELOAD || true


RUN echo "USER=$USER"

RUN env | sort

RUN ps aux



