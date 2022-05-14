# Fail on any command.
set -euxo pipefail

# Color Theme
dconf load /org/gnome/terminal/legacy/profiles:/:fb358fc9-49ea-4252-ad34-1d25c649e633/ < configs/terminal_profile.dconf

# Add it to the default list in the terminal
add_list_id=fb358fc9-49ea-4252-ad34-1d25c649e633
old_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list | tr -d "]")

if [ -z "$old_list" ]
then
	front_list="["
else
	front_list="$old_list, "
fi

new_list="$front_list'$add_list_id']"
dconf write /org/gnome/terminal/legacy/profiles:/list "$new_list" 
dconf write /org/gnome/terminal/legacy/profiles:/default "'$add_list_id'"
