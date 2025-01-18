function bw-fzf

  set jq_data (bw list items)

  # Use jq to parse the data and fzf to select an item by ID, with a minimal tmux preview
  set selected (echo $jq_data | jq -r '.[] | "\(.id)\t\(.name)\t\(.login.username)\t\(.login.password)"' | fzf \
      --header="Select an entry by name and press Enter to copy password" \
      --with-nth=2 \
      --preview="echo {} | awk -F '\t' '{print \"Name: \" \$2 \"\nUsername: \" \$3 \"\nID: \" \$1}'" \
      --preview-window=up:3:wrap)

  
  set id (echo $selected | awk -F '\t' '{print $1}')
  set name (echo $selected | awk -F '\t' '{print $2}')
  set username (echo $selected | awk -F '\t' '{print $3}')
  set password (echo $selected | awk -F '\t' '{print $4}')
  
  if test -n "$password"
      echo -n "$password" | pbcopy 2>/dev/null; and echo "Password for $name copied to clipboard!"
      or echo -n "$password" | xclip -selection clipboard; and echo "Password for $name copied to clipboard!"
  else
      echo "No password found for $name"
  end
end
