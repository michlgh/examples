FROM python:slim-bookworm

RUN apt update && apt install --no-install-recommends -y curl jq && apt clean && apt autoclean

WORKDIR /app

COPY run /app

CMD ["bash", "/app/run"]
