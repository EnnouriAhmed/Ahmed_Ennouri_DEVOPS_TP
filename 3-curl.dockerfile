FROM alpine:latest

RUN apk add --no-cache curl

RUN adduser -D ahmedtestuser
USER ahmedtestuser

ENTRYPOINT ["curl"]
