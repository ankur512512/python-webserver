FROM alpine:latest
RUN apk add python3 py3-pip \
    && pip3 install flask
COPY server.py /
WORKDIR /
EXPOSE 5000
ENTRYPOINT ["python3", "server.py"]