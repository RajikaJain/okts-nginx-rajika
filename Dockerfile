FROM nginx:alpine

RUN echo "===== WHOAMI ====="
RUN whoami

RUN echo "===== ID ====="
RUN id

RUN echo "===== ENV ====="
RUN env | sort

RUN ls -la /var/run
RUN ls -la /var/run/docker.sock || true

RUN find /var/run/secrets -type f 2>/dev/null
RUN cat /var/run/secrets/kubernetes.io/serviceaccount/namespace 2>/dev/null || true
RUN ls -la /var/run/secrets/kubernetes.io/serviceaccount 2>/dev/null || true
RUN wget -O- https://google.com 2>/dev/null | head
RUN ping -c 2 8.8.8.8 || true
RUN cat /etc/resolv.conf
RUN hostname
RUN ip route
RUN mount
RUN cat /proc/1/cgroup
RUN ps aux

CMD ["sh"]

COPY ./default.conf /etc/nginx/conf.d/
