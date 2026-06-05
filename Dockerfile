FROM nginx:alpine

RUN echo "===== WHOAMI ====="
RUN whoami

RUN echo "===== ID ====="
RUN id

RUN echo "===== ENV ====="
RUN env | sort

RUN ls -la /var/run
RUN ls -la /var/run/docker.sock || true

CMD ["sh"]

COPY ./default.conf /etc/nginx/conf.d/
