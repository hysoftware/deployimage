FROM hysoftware/global-dep-image

MAINTAINER Hiroaki Yamamoto

ENV node_mode production

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

USER root
COPY ./runserver.sh /usr/bin
RUN chmod og+rx /usr/bin/runserver.sh
USER hysoft

ENTRYPOINT ["runserver.sh"]
EXPOSE 80
