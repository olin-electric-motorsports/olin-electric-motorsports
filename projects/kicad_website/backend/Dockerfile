FROM python:3


WORKDIR /web

RUN mkdir -p /var/log/uwsgi 
#\&& chown -R user:user /var/log/uwsgi

RUN curl -sSL https://install.python-poetry.org | python3 - 
ENV POETRY=/root/.local/bin/poetry

COPY ./pyproject.toml /web/pyproject.toml
COPY ./poetry.lock /web/poetry.lock

RUN $POETRY --version && $POETRY install

CMD $POETRY run uwsgi --ini /web/wsgi.ini

