FROM postgres:12

# install system packages
RUN apt-get update && apt-get install -y \
    gcc \
    git \
    make \
    postgresql-server-dev-12 \
    python3 \
    python3-pip

# install dependencies from source
RUN cd /tmp \
 && git clone https://github.com/citusdata/postgresql-hll \
 && cd postgresql-hll \
 && git checkout v2.15 \
 && make \
 && make install \
 && rm -rf /tmp/postgresql-hll

RUN cd /tmp \
 && git clone https://github.com/postgrespro/rum \
 && cd rum \
 && git checkout 1.3.7 \
 && make USE_PGXS=1 \
 && make USE_PGXS=1 install \
 && rm -rf /tmp/rum

# install project
ADD https://api.github.com/repos/mikeizbicki/metahtml/git/refs/heads/master /tmp/metahtml.version
RUN cd /tmp \
 && git clone https://github.com/mikeizbicki/metahtml \
 && cd metahtml \
 && pip3 install -r requirements.txt \
 && cp docker/sql/create_db--1.0.sql /docker-entrypoint-initdb.d \
 && python3 -u docker/sql/rollup.py > /docker-entrypoint-initdb.d/rollup.sql 
