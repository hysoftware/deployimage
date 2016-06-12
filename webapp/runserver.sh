#!/usr/bin/sh
secret=$(mkpasswd -l 40 -s 4 -C 12 -c 12 -d 12) \
repo=${HOME}/venv/webapp uwsgi --lazy-apps \
-y /home/hysoft/venv/webapp/etc/uwsgi.yml
