FROM node:10-alpine

RUN npm cache clean --force && \
	npm config set strict-ssl false

EXPOSE 3000 3001

COPY . /gremlin-visualizer
WORKDIR /gremlin-visualizer

RUN cd /gremlin-visualizer && \
	npm install

CMD /bin/sh scripts/entrypoint.sh
