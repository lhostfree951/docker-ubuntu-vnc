# Ubuntu Desktop in Docker

Ubuntu 22.04 in Docker with novnc in the simplest way.

### Features
- [x] Tixati in Ubuntu because Tixati only support in GUI mode.

### Run
```shell
# Ubuntu with novnc
docker build -t allape/ubuntu-vnc .
# Tixati
cd tixati
docker build -t allape/tixati .
docker compose -f compose.tixati.yaml up -d
```
