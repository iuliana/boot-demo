FROM python:3.12.2-slim

RUN mkdir /app
WORKDIR /app

ADD requirements.txt /app
ADD main.py /app

RUN pip3 install -r requirements.txt

ENV PORT 8080
EXPOSE 8080

CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8080", "main:app"]