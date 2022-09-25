FROM python:3.10-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV POETRY_VERSION 1.1.13

RUN apt-get update && apt-get install upx-ucl -y

RUN pip install "poetry==$POETRY_VERSION" && poetry config virtualenvs.create false

COPY docker-entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh

WORKDIR /build

ENTRYPOINT [ "/bin/entrypoint.sh" ]
