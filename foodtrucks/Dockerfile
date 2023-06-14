FROM node:14-alpine3.15
RUN apk add python2 && python -m ensurepip && rm -r /usr/lib/python*/ensurepip && pip install --upgrade pip setuptools && rm -r /root/.cache
RUN pip install --upgrade pip
RUN mkdir -p flask-app && mkdir -p utils
COPY flask-app flask-app/
COPY utils /utils
WORKDIR /flask-app
RUN npm install && npm run build
RUN python -m pip install elasticsearch
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python","app.py"] 
