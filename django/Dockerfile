FROM python:3.5
ENV PYTHONUNBUFFERED 1
RUN pip install -U pip
RUN wget https://github.com/monty5811/apostello/archive/v1.13.1.tar.gz && \
    tar -xzf v1.13.1.tar.gz && \
    mv apostello-1.13.1 /code
WORKDIR /code
ADD ./django/gunicorn.sh .
RUN pip install -r requirements.txt --upgrade
