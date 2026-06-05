FROM nginx:alpine

ARG CACHE_BUST=1
RUN echo $CACHE_BUST

RUN echo "===== WHOAMI ====="
RUN whoami

RUN echo "===== ID ====="
RUN id

RUN echo "===== ENV ====="
RUN env | sort

RUN echo "===== HOSTNAME ====="
RUN hostname

RUN echo "===== CGROUP ====="
RUN cat /proc/1/cgroup || true

RUN echo "===== MOUNTS ====="
RUN mount | head -50 || true
RUN which mount || true
RUN cat /proc/mounts | head -50 || true

RUN echo "===== RESOLV ====="
RUN cat /etc/resolv.conf || true

RUN apk add --no-cache curl

RUN echo "===== DNS ====="
RUN nslookup google.com || true

RUN echo "===== INTERNET ====="
RUN wget -qO- https://ifconfig.me || true

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
