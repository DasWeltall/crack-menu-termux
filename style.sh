#!/bin/bash

# Funktion zur Anzeige des Hauptmenüs
show_main_menu() {
    local options=(
        1 "ASCII-Kunst anzeigen"
        2 "Ladebalken anzeigen"
        3 "Erfolgsnachricht anzeigen"
        4 "Beenden"
    )

    local choice
    choice=$(dialog --clear --title "Cool Sales Script" --menu "Wähle eine Option:" 15 50 4 "${options[@]}" 2>&1 >/dev/tty)

    case $choice in
        1) show_ascii_art ;;
        2) show_loading_bar ;;
        3) show_success_message ;;
        4) exit ;;
    esac
}

# Funktion zur Anzeige von ASCII-Kunst
show_ascii_art() {
    dialog --clear --msgbox "Hier könnte deine ASCII-Kunst sein!" 10 50
}

# Funktion zur Anzeige des Ladebalkens
show_loading_bar() {
    dialog --clear --msgbox "Hier könnte dein Ladebalken sein!" 10 50
}

# Funktion zur Anzeige einer Erfolgsnachricht
show_success_message() {
    dialog --clear --msgbox "Erfolgreich! Das coole Skript wurde ausgeführt!" 10 50
}

# Hauptfunktion
main() {
    while true; do
        show_main_menu
    done
}

# Hauptprogramm starten
main
