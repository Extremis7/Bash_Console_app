#!/bin/bash


# Note **** To Devs****
# Calling a function from another .sh file that has a 
# shebang (like #!/bin/bash) will cause the script to
# run in a subshell with inherited permissions. 

# Remember that all imports are sourced as if from this point 
# in the script. Menus/main_menu.sh is a good example of 
# how you have to source relative to the calling function.
source ./Menus/main_menu.sh
show_Mainmenu
