#!/bin/bash

# Funktion zur Anzeige des Ladebalkens
show_loading_bar() {
    local delay=0.1
    local chars="/-\|"
    local i=0

    while true; do
        echo -en "\r[${chars:$i:1}] "
        sleep $delay
        ((i = (i + 1) % 4))
    done
}

# Funktion zur Anzeige einer Erfolgsnachricht
show_success_message() {
    echo -e "\n\nErfolgreich! Das coole Shell-Skript wurde ausgeführt!"
}

# Funktion zum Ändern des Hintergrundstils von Termux
change_termux_style() {
    termux-setup-storage
    echo -e "\033]11;#000000\007"
    echo -e "\033]10;#ffffff\007"
}

# Hauptfunktion
main() {
    change_termux_style
    show_loading_bar &
    loading_pid=$!

    # Hier kannst du deine eigenen Befehle oder Aktionen einfügen, die du ausführen möchtest
    sleep 5

    # Töte den Ladebalkenprozess
    kill $loading_pid > /dev/null 2>&1

    # Lösche die letzte Zeile des Ladebalkens
    echo -en "\r\033[K"

    # Zeige die Erfolgsnachricht
    show_success_message
}

# Hauptprogramm starten
main
