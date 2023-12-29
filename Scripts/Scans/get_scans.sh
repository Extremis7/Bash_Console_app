# You'll need elevated privileges to run this script so write message to the user. 
# tshark needs to be installed for this script to work so you'll need to use the technique below to check if it is installed 
# and install it if it is not.

# Technique to check if a command is installed on the computer before running the script
# if ! command -v nmtui &> /dev/null
# then
#     echo "nmtui could not be found"
#     echo "Would you like to install it? (y/n)"
#     read -r answer
#     if [ "$answer" != "${answer#[Yy]}" ] ;
#     then
#         sudo apt install network-manager
#     else
#         echo "Skipping installation"
#     fi
# else
#     echo "nmtui is installed"
#     # You can run your command here
# fi