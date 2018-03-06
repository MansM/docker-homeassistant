FROM debian:stretch-slim

ARG HAVERSION=_HAVERSION_
ARG GATTLIBVERSION=0.20150805

#installing python
RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends python3-dev python3-pip python3-setuptools python3-pkgconfig \
                                           libboost-thread-dev libboost-python-dev \
                                           libudev-dev build-essential libglib2.0-0 libglib2.0-dev  \
                                           bluetooth libbluetooth-dev libmariadbd-dev && \
    apt clean all && rm -rf /var/cache/apt/*

#installing hass and dependency wheel
RUN pip3 install --no-cache-dir wheel && \
    pip3 install --no-cache-dir homeassistant==${HAVERSION}

#Installing additional pip modules (extracting the versions from the components)
COPY install.py /install.py
COPY modules.txt /modules.txt

#gattlib is not working through normal install
RUN cd /tmp/ && pip3 download gattlib==${GATTLIBVERSION} && \
    tar -xvzf gattlib-${GATTLIBVERSION}.tar.gz && \
    sed -ie 's/boost_python-py34/boost_python-py35/' gattlib-${GATTLIBVERSION}/setup.py && \
    pip3 install --no-cache-dir gattlib-${GATTLIBVERSION}/ && \
    rm -rf /tmp/gattlib-${GATTLIBVERSION} && \
    chmod 744 /usr/local/lib/python3.5/dist-packages/gattlib-${GATTLIBVERSION}.egg-info/PKG-INFO

  
RUN python3 /install.py && rm -rf /root/.cache/pip

RUN groupadd homeassistant && \
    useradd \
      --create-home \
      -g homeassistant \
      homeassistant

USER homeassistant
CMD hass