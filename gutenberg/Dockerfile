FROM python:3.9
RUN apt-get update && apt-get install -y netcat-openbsd rsync

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN rm -rf static/
RUN chmod +x manage.py entrypoint.sh

CMD [ "./entrypoint.sh" ]
