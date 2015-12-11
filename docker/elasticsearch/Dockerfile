FROM centos:7

RUN yum install -y java-1.8.0-openjdk-headless tar

RUN groupadd -r elasticsearch && useradd -r -g elasticsearch elasticsearch

# grab gosu for easy step-down from root
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu

# elasticsearch
RUN curl -fL https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.1.0.tar.gz | tar xzf - -C /opt && \
mv /opt/elasticsearch-2.1.0 /opt/elasticsearch

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/elasticsearch/bin:/opt/elasticsearch/data:/opt/elasticsearch/config

COPY docker/elasticsearch/docker-entrypoint.sh /

VOLUME /opt/elasticsearch/data

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]