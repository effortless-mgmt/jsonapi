#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
  cd "$DIR/.." # Go to project dir.

  ssh $SSH_USERNAME@$SSH_HOSTNAME -o StrictHostKeyChecking=no -p SSH_PORT <<-EOF
    cd $SSH_PROJECT_FOLDER
    git pull
    docker-compose down
    docker-compose up -d
EOF
)


smaug.effortless.dk