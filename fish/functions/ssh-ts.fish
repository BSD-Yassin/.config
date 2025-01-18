
function ssh-ts --description 'Find and connect to peer devices in Tailscale'
 
  set -Ux json_ip (tailscale status --json)

  # Define a more user-friendly FZF bind string
  set fzfcmd "
    enter:execute(ssh {}),
    alt-enter:execute(ssh root@{}),
    ctrl-e:change-preview(echo \$json_ip | jq -r '.Peer[] | select(.TailscaleIPs[0] == \"{}\")' | bat --style=numbers --color=always --language=json),
    ctrl-r:execute(ping {})+change-preview(echo 'Testing connection to {}' | bat --style=numbers --color=always --language=plaintext)
  "

  # Use FZF to display and select devices based on IP addresses
  echo $json_ip | jq -r '.Peer[] | "\(.TailscaleIPs[0])\t\(.HostName)\t\(.Online)"' | fzf \
    --header="Select a device (IP, Hostname, Online Status)" \
    --delimiter="\t" \
    --with-nth=2 \
    --preview="echo \$json_ip | jq -r '.Peer[] | select(.TailscaleIPs[0] == \"{}\") | { Name: .HostName, OS: .OS, DNSName: .DNSName, IPs: .TailscaleIPs, Online: .Online }' | bat --style=numbers --color=always --language=json" \
    --preview-window=up:3:wrap \
    --bind=$fzfcmd

  set -e json_ip
end

