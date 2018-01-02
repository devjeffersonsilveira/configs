#!bin/bash
function dockerclear {
    docker stop $(docker ps -a -q)
    docker rmi -f $(docker images -f "dangling=true" -q)
    docker rm $(docker ps --filter=status=exited --filter=status=created -q)
    docker volume rm -f  $(docker volume ls -qf dangling=true)
    docker volume prunes
}

function breakSession {
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