#!/usr/bin/env bash

which_r() {
  parent_dir="$PWD/build"
  settings_file_path="$PWD/.vscode/settings.json"
  launch_script="$PWD/scripts/launch_r.sh"

  built_in_r_version=$(R --version | awk '/^R version/ {print $3}')

  echo "Which version of R should be used in new R terminals?"
  echo "  1. R $built_in_r_version (built-in)"

  # Detect additional R builds
  subdirs=()
  counter=2
  if [ -d "$parent_dir" ]; then
    for dir in "$parent_dir"/*; do
      if [ -x "$dir/bin/R" ]; then
        subdirs+=("$(basename "$dir")")
        echo "  $counter. ${subdirs[-1]}"
        ((counter++))
      fi
    done
  fi

  range=$((counter - 1))
  [ "${#subdirs[@]}" -eq 0 ] && echo "No additional R builds found."

  read -p "Enter number (1–$range): " choice

  if [ "$choice" -eq 1 ] 2>/dev/null; then
    selected="/usr/bin/R"
  elif [ "$choice" -ge 2 ] && [ "$choice" -le "$range" ] 2>/dev/null; then
    idx=$((choice - 2))
    selected="$parent_dir/${subdirs[$idx]}/bin/R"
  else
    echo "Invalid choice; defaulting to built-in"
    selected="/usr/bin/R"
  fi

  # Update launch_r.sh to call the selected R
  sed -i "s|^exec .*/R|exec $selected|" "$launch_script"

  # Update VS Code setting if it exists
  if [ -f "$settings_file_path" ]; then
    jq --arg r "$selected" '."r.rpath.linux"=$r' \
      "$settings_file_path" > "${settings_file_path}.tmp" \
      && mv "${settings_file_path}.tmp" "$settings_file_path"
  fi

  echo "Now using R at: $selected"
  echo "Reload VS Code to apply updates."
}