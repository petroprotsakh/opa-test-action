FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl
RUN curl -L -o /opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
RUN chmod 755 /opa
RUN /opa version
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
