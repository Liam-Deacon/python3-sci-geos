FROM python:3.8-slim-buster

RUN pip install --no-cache-dir pbr docutils sphinx setuptools cython

# Install other key utilities
RUN apt-get update && \
  apt-get install -y make gcc && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt install -y proj-bin libgeos-dev libproj-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy scipy pandas geopandas 'pyproj>=2.2.0' cartopy

# Clean system
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/* \
 && mkdir -p /var/lib/apt/lists/ \
 && mkdir -p /etc/apt/sources.list.d/

CMD /bin/bash 
