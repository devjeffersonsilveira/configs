#!bin/zsh
function dockerclear() {
    if [[ $1 == "-s" ]]; then
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
    fi

    docker system prune -f --volumes
}

function breakSession() {
    PWD=$(pwd)
    WHERE=here
    SESSION_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)

    if [[ $1 == "-t" ]]; then
        WHERE=there
    fi
    if [[ $WHERE == there ]]; then
        TERMINAL_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeTerminalId)
        qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal ${TERMINAL_ID} "clear"
        SESSION_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
        TERMINAL_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId ${SESSION_ID})
    fi
    if [[ $WHERE == here ]]; then
        qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal ${TERMINAL_ID} "clear"
        TERMINAL_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitSessionTopBottom ${SESSION_ID})
    fi

    qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal ${TERMINAL_ID} "cd ${PWD}; clear"
}

function proj() {
    PROJECT=$@
    cd ~/Projects

    if [[ $1 == "simonetti" ]]; then
        echo "vpn"
        cd MoveisSimonetti/vpn
        sudo nohup openvpn --config client.ovpn &
        echo "catalogo"
        cd ../catalogo
        dck up -d app.catalogo.test
        code ./
        echo "webpdv"
        cd ../webpdv
        dck up -d webpdv
        code ./
    fi
}
