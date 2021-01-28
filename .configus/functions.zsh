#! zsh
function dockerclear() {
    if [[ $1 == "-s" ]]; then
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
    fi

    docker system prune -f --volumes
}

function find_and_kill() {
    if [[ $1 == "-k" ]]; then
        ps aux | egrep $2 | grep -v grep | awk '{print $2}' | xargs kill
        return ($?)
    fi

    ps aux | egrep $1 | grep -v grep 
}
