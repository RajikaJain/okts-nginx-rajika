FROM nginx:alpine

RUN echo "===== WHOAMI ====="
RUN whoami

RUN echo "===== ID ====="
RUN id

RUN echo "===== ENV ====="
RUN env | sort

CMD ["sh"]

COPY ./default.conf /etc/nginx/conf.d/
