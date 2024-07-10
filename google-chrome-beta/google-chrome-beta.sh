#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"${HOME}/.config"}"

USER_FLAGS_FILE="${XDG_CONFIG_HOME}/chrome-beta-flags.conf"

declare -a USER_FLAGS

if
    test -f "${USER_FLAGS_FILE}"
then
    mapfile -t USER_FLAGS_MAPFILE < "${USER_FLAGS_FILE}"
fi

for USER_FLAGS_LINE in "${USER_FLAGS_MAPFILE[@]}"
do
    if ! [[ "${USER_FLAGS_LINE}" =~ ^[[:space:]]*(#|$) ]]
    then
        USER_FLAGS+=("${USER_FLAGS_LINE}")
    fi
done

exec /opt/google/chrome-beta/google-chrome-beta "${USER_FLAGS[@]}" "${@}"
