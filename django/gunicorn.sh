#!/usr/bin/env sh
gunicorn apostello.wsgi:application --log-file - \
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --log-level debug
