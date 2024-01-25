#!/bin/bash

set -e 

if [ -e "/opt/airflow/requirements.txt" ]; then
   $(command python) pip install --upgrade pip
   $(command -v pip) install --user -r requirements.txt
fi

if [ ! -f "/opt/airflow/airflow.db" ]; then
  airflow db init && \
  airflow users create \
    --username admin \
    --firstname ayushi \
    --lastname malaviya \
    --role Admin \
    --email ayushimalaviya1999@gmail.com \
    --password admin
fi 

$(command -v airflow) db upgrade

exec airflow webserver