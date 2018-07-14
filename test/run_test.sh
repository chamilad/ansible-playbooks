#!/bin/bash

# TODO: check if docker image exists

# Mount the parent directory to container and run ansible playbook apply

parent_dir=$(dirname $(pwd))

# Run bash
# docker run -p 9443:9443 -v $parent_dir:/ansible -it chamilad/ansible-test:ubuntu-xenial /bin/bash

# Run directly
docker run -p 9443:9443 -v $parent_dir:/ansible -it chamilad/ansible-test:ubuntu-xenial ansible-playbook site.yml -c local -i hosts --limit @/ansible/site.retry