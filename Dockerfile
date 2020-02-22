FROM python:3.7.3-stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENV JWT_SECRET='myjwtsecret'
ENV LOG_LEVEL=DEBUG


ENTRYPOINT ["gunicorn", "-b", "80:8080", "main:APP"]



