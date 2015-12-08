FROM centos:7

ENV ELASTIC_SEARCH_VERSION 1.7.3
ENV JAVA_VERSION 1.8.0

RUN mkdir -p /tmp/elasticsearch/ && \
    cd /tmp/elasticsearch/ && \
    yum install -y java-${JAVA_VERSION}-openjdk.x86_64 && \
    curl -SLO https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ELASTIC_SEARCH_VERSION}.noarch.rpm && \
    rpm -ivh elasticsearch-${ELASTIC_SEARCH_VERSION}.noarch.rpm && \
    systemctl enable elasticsearch.service && \
    cd /usr/local/bin/ && \
    rm -rf /tmp/elasticsearch/

# install all dependencies
COPY requirements.txt /mi/
RUN yum install -y epel-release
RUN yum install -y python-pip python-crypto openssl openssh-clients && \
    pip install -U -r /mi/requirements.txt

# load microservices-infrastructure and default setup
COPY . /mi/

# load user custom setup
ONBUILD COPY ssl/ /mi/ssl/
ONBUILD COPY security.yml /mi/security.yml
