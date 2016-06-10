FROM hysoftware/baseimage

MAINTAINER Hiroaki Yamamoto

ENV host 0.0.0.0
ENV port 80
ENV node_mode production

COPY ./runserver.sh /usr/bin
RUN chmod og+rx /usr/bin/runserver.sh

RUN useradd -m hysoft
USER hysoft

WORKDIR /home/hysoft
RUN virtualenv venv
WORKDIR /home/hysoft/venv
RUN git clone https://github.com/hiroaki-yamamoto/hysoftware.net.git webapp
WORKDIR /home/hysoft/venv/webapp
RUN . ../bin/activate && pip install -r requirements.txt && deactivate

RUN npm install
RUN npm test
RUN rm -rf node_module frontend_coverage .coverage
ENV mode production

ENTRYPOINT ["runserver.sh"]
EXPOSE 80
