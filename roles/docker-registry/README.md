Docker Registry
===============

A role to setup private Docker goes here.

Requirements
------------

The certificate used by the registry during TLS communication should be pre-generated before running the playbook.

Role Variables
--------------

docker_registry_hostport - port to bind docker registry to on the host, default: 5000
docker_registry_image - name of the image used to run the Docker registry, default: registry
docker_registry_image_tag - tag of the image used to run the Docker registry, default: 2
docker_registry_container_name - name of the container running the Docker registry, default: registry

