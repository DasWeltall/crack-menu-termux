#!/bin/bash

# Funktion zur Anzeige des Hauptmenüs
show_main_menu() {
    local options=(
        1 "Network Mapper scan"
        2 "Aircrack-ng"
        3 "Wireshark"
        4 "Beenden"
    )

    local choice
    choice=$(dialog --clear --title "Cracker Area" --menu "Wähle eine Option:" 15 50 4 "${options[@]}" 2>&1 >/dev/tty)

    case $choice in
        1) run_nmap_scan ;;
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
    dialog --clear --msgbox "wlan0 need root!" 10 50
}

# Funktion zur Anzeige einer Erfolgsnachricht
show_success_message() {
    dialog --clear --msgbox "wlan0 need root" 10 50
}
# Funktion zum Ausführen eines Nmap-Scans
run_nmap_scan() {
    local output
    output=$(nmap -sn 192.168.0.0/24 2>&1)

    dialog --clear --title "Nmap Scan Ergebnisse" --msgbox "$output" 20 70
}
# Hauptfunktion
main() {
    while true; do
        show_main_menu
    done
}

# Hauptprogramm starten
main
