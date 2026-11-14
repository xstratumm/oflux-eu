FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl
RUN curl -fsSL -o /openflux https://github.com/p1neappleXpress/OpenFlux/releases/download/v0.17.1/openflux-linux-amd64 && chmod +x /openflux
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
