#!/bin/sh

#Continuously reset sudo timestamp to prevent requiring password while scripts are being run
function keepAlive() {
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
