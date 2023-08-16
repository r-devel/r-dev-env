#!/bin/bash

echo -e "
Welcome to the Containerised R Development Environment

Here you can modify, compile and use R as described in
the r development guide:
    https://contributor.r-project.org/rdevguide/GetStart.html#building-r

To help you, we have already set the following environment variables:

BUILDDIR = \"$BUILDDIR\"
TOP_SRCDIR = \"$TOP_SRCDIR\"

Have fun \U0001F601
"

echo "Do you want to install trunk version of R?(Y/N)"
read answer

if [ "$answer" = "Y" ]; then
    echo "Installing the latest R trunk version."
    svn checkout https://svn.r-project.org/R/trunk/ "$TOP_SRCDIR"
    mkdir -p "$BUILDDIR"
    cd "$BUILDDIR"

    "$TOP_SRCDIR/configure" --enable-R-shlib --without-recommended-packages

    make check
    make

    #changing terminal path

# Path to the settings.json file
    settings_file_path="/home/vscode/.vscode-remote/data/Machine/settings.json"

 
# Read the existing JSON content
    settings_data=$(cat "$settings_file_path")


# Update the desired setting using jq (a command-line JSON processor)
    updated_settings_data=$(echo "$settings_data" | jq '."r.rterm.linux"="/usr/bin/R"')

 
# Write the updated JSON content back to the file
   echo "$updated_settings_data" > "$settings_file_path"
    
else
    echo "If you want to install R trunk version please type Y by re-running install_r.sh script !"
fi


echo "Installed R-devel trunk"



