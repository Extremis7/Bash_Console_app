# Can't wait to started!



# Function to get CPU, RAM, and Disk information
get_cpu_ram_disk_info() {
    echo "CPU, RAM, and Disk information"
    echo "CPU: $(lscpu | grep "Model name" | sed 's/Model name: *//')"
    echo "Threads: $(lscpu | grep "Thread(s) per core" | sed 's/Thread(s) per core: *//')"
    echo "Cores: $(lscpu | grep "Core(s) per socket" | sed 's/Core(s) per socket: *//')"
    echo "Sockets: $(lscpu | grep "Socket(s)" | sed 's/Socket(s): *//')"
    echo "CPU max MHz: $(lscpu | grep "CPU max MHz" | sed 's/CPU max MHz: *//')"
    echo "Virtualisation: $(lscpu | grep "Virtualisation" | sed 's/Virtuali[z,s]ation: *//')"
    echo "RAM: $(free -h | awk '/^Mem/ {print $2}')"
    echo "Disk: $(df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}')"
    echo "Disk usage: $(df -h | awk '$NF=="/"{printf "%s\n", $5}')"
    echo "Disk free: $(df -h | awk '$NF=="/"{printf "%s\n", $4}')"
    echo "Disk total: $(df -h | awk '$NF=="/"{printf "%s\n", $2}')"
    echo "____________________________________________________________"
}

# Function to get graphics card information
get_graphics_card_info() {
    echo "Graphics card information"
    # Shortcut way to get everything after your regex '//' (after the colon in this case): sed 's/.*: //'
    echo "Graphics card: $(lspci | grep VGA | sed 's/.*: //')"
    echo "Graphics card driver: $(lspci -k | grep -A 2 -i "VGA" | grep "Kernel driver in use" | sed 's/.*: //')"
    echo "____________________________________________________________"
}

# Function to get network information (include ethernet and wifi)
get_network_info() {
    echo "Network information"
    echo -e "Active Links: \n$(ip link show | grep "state UP"  )"
    echo -e "\nKnown IPs (Class notation): \n$(ip addr show | grep "inet" | awk '{print $2}')"
    echo "____________________________________________________________"
}

# Function to get OS information
get_os_info() {
    echo "OS information"
    # In this case with the sed command, we are removing the "PRETTY_NAME=" from the output and keeping the rest with '//'
    echo "OS: $(cat /etc/os-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//')"
    echo "Kernel: $(uname -r)"
    echo "____________________________________________________________"
}

# Function to get user information including groups and permissions
get_user_info() {
    echo "User information"
    echo "User: $(whoami)"
    echo "Groups: $(groups)"
    echo "____________________________________________________________"
}

# Function to display the above information in a nice format and save in the Results folder under a folder labeled with the name of the user, date, time.
# Will be the function called from the system menu
get_all_info() {
    echo "Getting all information"
    # Create a folder to store the results
    # Will explore an option to better identify the folder
    folder_name="$(whoami)_$(uname -s)_$(uname -m)"
    mkdir -p Results/"$folder_name"
    # Redirect the output of the functions to a file in the Results folder
    # In parallel as there are no dependencies between the functions and decreases likelihood regex missing because of minute change.
    get_cpu_ram_disk_info > Results/"$folder_name"/cpu_ram_disk_info.txt &
    get_graphics_card_info > Results/"$folder_name"/graphics_card_info.txt &
    get_network_info > Results/"$folder_name"/network_info.txt &
    get_os_info > Results/"$folder_name"/os_info.txt &
    get_user_info > Results/"$folder_name"/user_info.txt &
    wait
    echo "All information saved in Results/$folder_name"
    echo "____________________________________________________________"
    sleep 1.5
    clear
}