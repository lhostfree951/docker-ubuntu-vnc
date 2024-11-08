FROM ubuntu:latest

ENV VNC_PASSWORD=123_567
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/Sao_Paulo

RUN  apt-get update && \
     apt-get install -y xfce4 xfce4-goodies tigervnc-standalone-server novnc && \
     rm -rf /var/lib/apt/lists/* && \
     rm -f /etc/apt/apt.conf.d/10proxy.conf

COPY vnc_config /root/.vnc/config
COPY entrypoint.sh /entrypoint.sh

RUN echo "$VNC_PASSWORD" > /root/plain_passwd.txt && \
    vncpasswd -f < /root/plain_passwd.txt > /root/.vnc/passwd && \
    rm -f /root/plain_passwd.txt && \
    chmod 600 /root/.vnc/passwd

RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh

# docker build -t allape/ubuntu-vnc .
