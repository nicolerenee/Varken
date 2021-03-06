FROM amd64/python:3.7.2-alpine

LABEL maintainers="dirtycajunrice,samwiseg0"

ENV DEBUG="True"

WORKDIR /app

COPY /requirements.txt /Varken.py /app/

COPY /varken /app/varken

COPY /data /app/data

COPY /utilities /app/data/utilities

RUN apk add --no-cache tzdata && \
    python3 -m pip install -r /app/requirements.txt

CMD cp /app/data/varken.example.ini /config/varken.example.ini && python3 /app/Varken.py --data-folder /config

VOLUME /config
