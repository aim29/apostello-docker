FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN pip install -U pip
RUN wget https://github.com/monty5811/apostello/archive/dev.tar.gz && \
    tar -xzf dev.tar.gz && \
    mv apostello-dev /code && \
    echo USE_X_FORWARDED_HOST = True >> /code/settings/docker_prod.py && \
    echo "SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTOCOL', 'https')" >> /code/settings/docker_prod.py
WORKDIR /code
ADD ./django/gunicorn.sh .
RUN pip install -r requirements.txt --upgrade
