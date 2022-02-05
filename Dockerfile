FROM node:16-alpine

RUN npm cache clean --force && \
	npm config set strict-ssl false && \
	npm install -g opencollective

EXPOSE 3000 3001

COPY . /gremlin-visualizer
WORKDIR /gremlin-visualizer

RUN cd /gremlin-visualizer && \
	npm install

CMD /bin/sh scripts/entrypoint.sh
