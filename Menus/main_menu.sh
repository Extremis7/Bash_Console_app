# Imports
source ./Menus/system_menu.sh

# Accept user input and take action with another function
show_Mainmenu() {
    while [ true ]; do
      local c

      echo "Welcome to the Main Menu"
      echo "1) Get System info"
      echo "2) Maintenance (once I figure out some)"
      echo "3) Scans (with Wireshark)"
      echo "4) Under Development"
      echo "5) Exit"
      echo "Please enter your choice: "

      read -r c
      case $c in
         1) echo "Navigating to System Info"
               sleep 1.5
               clear
               show_Systemmenu
            ;;
         2) echo "Navigating to Maintenance"
               sleep 1.5
               clear
         #    maintenance
            ;;
         3) echo "Navigating to Scans"
               sleep 1.5
               clear
         #    scans
            ;;
         4) echo "Welcome to the kitchen!"
               sleep 1.5
               clear
         #    under_development
            ;;
         5) echo "Another time then"
               sleep 1.5
               clear
               exit 0
            ;;
         *)
            echo "Please select a valid choice (1-5)."
            sleep 1.5
            clear
            show_Mainmenu
            ;;
      esac
    done
    
}