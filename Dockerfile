FROM python:3.10.10-alpine3.17

RUN apk add --no-cache mariadb-connector-c-dev
RUN apk update && apk add python3 python3-dev mariadb-dev build-base && pip3 install mysqlclient && apk del python3-dev mariadb-dev build-base

COPY www /var/www/html
RUN python3 -m pip install -r /var/www/html/requirements.txt

COPY www /var/www/html

WORKDIR /var/www/html
#CMD [ "python","app.py","runserver","0.0.0.0:80" ]
CMD [ "python","app.py" ]