FROM ubuntu:22.04

RUN apt update && apt install -y \
    bash \
    procps \
    iputils-ping

WORKDIR /app

COPY . .

RUN chmod +x monitoring.sh

CMD ["./monitoring.sh"]
