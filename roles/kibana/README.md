Kibana
======

Role to setup Kibana server.

Requirements
------------

The Kibana Docker image intended to be used should be readily available in the Docker registry.

Role Variables
--------------

docker_registry_fqdn - Docker registry hostname, default: localhost
docker_registry_port - Port the Docker registry listens on, default: 5000
elasticsearch_url - URL to access ElasticSearch, default: http://localhost:9200
kibana_container_name - Name of the Docker container running Kibana, default: kibana

