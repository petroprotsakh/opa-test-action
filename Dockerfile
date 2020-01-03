FROM alpine:latest
RUN apk add --no-cache curl
RUN curl -L -o /opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
RUN chmod 755 /opa
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
