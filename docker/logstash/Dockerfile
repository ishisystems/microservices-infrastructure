FROM centos:7

RUN yum install -y java-1.8.0-openjdk-headless tar

# Setup environment
ENV LS_VERSION 1.5.4
ENV LS_HOME /opt/logstash
ENV LS_CFG_BASE_DIR /etc/logstash
ENV LS_CFG_SSL_DIR ${LS_CFG_BASE_DIR}/.ssl
ENV LS_CFG_FILE_DIR ${LS_CFG_BASE_DIR}/conf.d
ENV LS_USER logstash
ENV LS_GROUP logstash

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/elasticsearch/bin

# Install requirements and Logstash
RUN yum install -y \
      curl \
      python \
      py-pip \
      bash &&\
    mkdir -p \
      ${LS_CFG_SSL_DIR} \
      ${LS_CFG_FILE_DIR}  \
      /opt &&\
    curl -sSL --insecure --location https://download.elasticsearch.org/logstash/logstash/logstash-${LS_VERSION}.tar.gz | tar zxf - -C /opt &&\
    ln -s /opt/logstash-${LS_VERSION} ${LS_HOME} &&\
    /usr/sbin/groupadd ${LS_GROUP} &&\
    /usr/sbin/useradd -d ${LS_HOME} -s /bin/bash -g ${LS_GROUP} ${LS_USER} &&\
    chown -R ${LS_USER}:${LS_GROUP} ${LS_HOME}/ ${LS_CFG_BASE_DIR} &&\
    chmod 700 ${LS_CFG_SSL_DIR}

# Configure environment
COPY logstash.sh /usr/local/bin/
COPY logstash/logstash.conf /etc/logstash/conf.d/
COPY logstash/logstash-shipper.conf /etc/logstash/conf.d/
COPY logstash/logstash-indexer.conf /etc/logstash/conf.d/

# Listen for defaults: 5000/tcp:udp (syslog), 5002/tcp (logstash-forwarder), 5004/tcp (journald), 5006/udp (Logspout), 5200/tcp (log4j)
EXPOSE 5000 5002 5004 5006 5200

# Expose volumes
VOLUME ["${LS_CFG_BASE_DIR}"]

ENTRYPOINT ["/usr/local/bin/logstash.sh"]
CMD [""]