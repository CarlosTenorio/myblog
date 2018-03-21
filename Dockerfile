FROM python:3.6

MAINTAINER Carlos Tenorio Pérez <cartenorioperez@gmail.com>

ENV APP_HOME /opt/app/

ADD . /opt/app/

WORKDIR $APP_HOME

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y gettext && \
    apt-get clean && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r requirements.txt

RUN python manage.py collectstatic --noinput

ENTRYPOINT ["python", "manage.py"]
