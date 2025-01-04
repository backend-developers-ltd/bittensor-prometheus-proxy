#!/bin/sh

# We assume that WORKDIR is defined in Dockerfile

./prometheus-cleanup.sh

if [ ! -z "$DATABASE_POOL_URL" ] || [ ! -z "$DATABASE_URL" ]; then
    PROMETHEUS_EXPORT_MIGRATIONS=0 ./manage.py wait_for_database --timeout 10
    # this seems to be the only place to put this for AWS deployments to pick it up
    PROMETHEUS_EXPORT_MIGRATIONS=0 ./manage.py migrate
fi

exec gunicorn -c gunicorn.conf.py
