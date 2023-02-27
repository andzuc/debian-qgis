FROM andzuc/debian-base
LABEL maintainer "Andrea Zuccherelli <andrea@zuccherelli.net>"

ENV LANG=en_EN.UTF-8

RUN apt-get install -y --no-install-recommends --no-install-recommends --no-install-suggests --allow-unauthenticated \
    gnupg \
    ca-certificates \
    curl \
    software-properties-common \
    locales \
    && localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && mkdir -m755 -p /etc/apt/keyrings \
    && curl -o /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/qgis-archive-keyring.gpg] https://qgis.org/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/qgis.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends --no-install-suggests --allow-unauthenticated \
	       qgis \
	       qgis-plugin-grass \
    && apt-get remove --purge -y \
	       gnupg \
	       curl \
    && apt-get -y autoremove \
    && apt-get -y clean

RUN useradd -m qgis \
    && mkdir /tmp/runtime-qgis \
    && chmod 0700 /tmp/runtime-qgis \
    && chown qgis.qgis /tmp/runtime-qgis
USER qgis
ENV XDG_RUNTIME_DIR /tmp/runtime-qgis
ENV HOME /home/qgis
WORKDIR $HOME
VOLUME $HOME
ENTRYPOINT ["/usr/bin/qgis"]
