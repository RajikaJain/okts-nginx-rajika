FROM nginx:alpine
RUN env | grep TEST_SECRET || true
RUN echo $TEST_SECRET || true

RUN env | grep abc || true
RUN echo $abc || true

RUN env | grep LD_PRELOAD || true
RUN echo $LD_PRELOAD || true

RUN ps aux



