FROM alpine:latest

LABEL maintainer="Eduardo Schulz eduardo.schulz@protonmail.com"
LABEL description="Simple container image that shows some debugging information"

RUN apk add --no-cache python3 coreutils iproute2 iputils grep


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

