FROM pe-dev3.ishisystems.com:5000/centos-7.2-nonet-plus-20151217

RUN yum install -y java-1.8.0-openjdk-headless tar

# Setup environment
ENV LS_VERSION 2.1.0
ENV LS_HOME /opt/logstash
ENV LS_CFG_BASE_DIR /etc/logstash
ENV LS_CFG_SSL_DIR ${LS_CFG_BASE_DIR}/.ssl
ENV LS_CFG_FILE_DIR ${LS_CFG_BASE_DIR}/conf.d

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN groupadd -r logstash && useradd -r -d /opt/logstash -g logstash logstash

# Install requirements and Logstash
RUN yum install -y \
      curl \
      which \
      bash &&\
    mkdir -p \
      ${LS_CFG_SSL_DIR} \
      ${LS_CFG_FILE_DIR}  \
      /opt &&\
    curl -sSL --insecure --location https://download.elasticsearch.org/logstash/logstash/logstash-${LS_VERSION}.tar.gz | tar zxf - -C /opt &&\
    ln -s /opt/logstash-${LS_VERSION} ${LS_HOME} &&\
    chown -R logstash:logstash ${LS_HOME}/ ${LS_CFG_BASE_DIR} &&\
    chmod 700 ${LS_CFG_SSL_DIR}

# Configure environment
COPY /docker-entrypoint.sh /
COPY /config /etc/logstash/conf.d

# Listen for defaults: 5000/tcp:udp (syslog), 5002/tcp (logstash-forwarder), 5004/tcp (journald), 5006/udp (Logspout), 5200/tcp (log4j)
EXPOSE 5000 5002 5004 5006 5200

# Expose volumes
VOLUME ["${LS_CFG_BASE_DIR}"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [""]