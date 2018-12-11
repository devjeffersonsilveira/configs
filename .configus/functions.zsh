#!bin/zsh
function dockerclear() {
    if [[ $1 == "-s" ]]; then
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
    fi

    docker system prune -f --volumes
}
