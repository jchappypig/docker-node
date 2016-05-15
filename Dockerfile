From ubuntu:14.04

RUN apt-get update && apt-get install -y nodejs npm

# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install --production
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Bundle app source
COPY . /src

EXPOSE  8080

CMD ["node", "/src/bin/www"]
