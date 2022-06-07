FROM debian:bullseye-slim

RUN apt-get update &&\
    apt-get install -y curl git-core &&\
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get update &&\
    apt-get install -y nodejs

RUN apt-get update &&\
    apt-get install -y build-essential

RUN adduser ethnetstats

RUN cd /home/ethnetstats &&\
    git clone https://github.com/minhnx2/eth-netstats.git &&\
    cd eth-netstats &&\
    npm install &&\
    npm install -g grunt-cli &&\
    grunt

RUN echo '#!/bin/bash\nset -e\n\ncd /home/ethnetstats/eth-netstats\n/usr/bin/npm start' > /home/ethnetstats/startscript.sh

RUN chmod +x /home/ethnetstats/startscript.sh &&\
    chown -R ethnetstats. /home/ethnetstats

USER ethnetstats
ENTRYPOINT ["/home/ethnetstats/startscript.sh"]
