FROM python:3.10-bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV POETRY_VERSION 1.2.2

RUN apt-get update && apt-get install upx-ucl -y

RUN pip install "poetry==$POETRY_VERSION" && poetry config virtualenvs.create false

WORKDIR /build

ENTRYPOINT [ "/bin/sh", \
             "-c", \
             "poetry install && \
              exec pyinstaller -F --clean --name $NAME setup.py" ]
