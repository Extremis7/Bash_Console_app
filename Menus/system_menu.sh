# Imports
source ./Scripts/System/get_machine_info.sh


show_Systemmenu() {
    local c

    echo "Welcome to the System Menu"
    echo "1) Fingerprint this system"
    echo "2) Get logs"
    echo "3) Exit"
    echo "Please enter your choice: "

    read -r c
    case $c in
        1) echo "Running Fingerprint. Output in Results folder"
            sleep 1.5
            clear
            get_all_info
           ;;
        2) echo "Gathering recent logs. Output in Results folder"
            sleep 1.5
            clear
        #    get_logs
           ;;
        3) echo "Returning to previous menu"
            sleep 1.5
            clear
           ;;
        *)
           echo "Please select a valid choice (1-3)."
           show_Systemmenu
           ;;
    esac
}