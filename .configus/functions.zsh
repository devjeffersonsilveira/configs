#!bin/bash
function dockerclear {
    docker stop $(docker ps -a -q)
    docker rmi -f $(docker images -f "dangling=true" -q)
    docker volume rm -f  $(docker volume ls -qf dangling=true)
    docker volume prunes
}
