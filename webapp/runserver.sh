#!/usr/bin/sh
export secret=$(mkpasswd -l 40 -s 4 -C 12 -c 12 -d 12)
. /home/hysoft/venv/bin/activate && python ${VIRTUAL_ENV}/webapp/run_app.py runserver
