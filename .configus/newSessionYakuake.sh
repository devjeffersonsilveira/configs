PWD=$(pwd)
SESSION_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId ${SESSION_ID})
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal ${TERMINAL_ID} "cd ${PWD}; clear"
