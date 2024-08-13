FROM node:14.4
ENV NPM_CONFIG_LOGLEVEL info

COPY package.json /tmp/package.json
COPY package-lock.json /tmp/package-lock.json

RUN npm install /tmp/

COPY index.js  /bin/index.js

RUN chmod +x /bin/index.js

USER nobody
EXPOSE 3418

ENTRYPOINT /usr/local/bin/node /bin/index.js --latitude ${SUNCALC_LATITUDE} --longitude ${SUNCALC_LONGITUDE} --listen-port ${SUNCALC_PORT}