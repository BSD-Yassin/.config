if status is-interactive
  # Commands to run in interactive sessions can go here
  direnv hook fish | source
  zoxide init fish | source
  fzf --fish | source
  
  if set -q $BW_SESSION
    set BW_SESSION (bw login | grep -m 1 -oP '(?<=BW_SESSION=")[^"]*' | awk 'NR==1 { print; exit }')
  end 
  
  set -x BG_DIR $HOME/Pictures/Wallpapers/


  set DOCKER_CLI_EXPERIMENTAL enabled
  set XDG_CONFIG_HOME $HOME
  set -gx EDITOR (which lvim || which nvim)

  alias l "lvim"
  alias cat "bat -p"
  alias c "bat"
  alias less "bat"

  # Abbr && Aliases
  # Git 
  abbr gc "git clone"
  abbr gg "lazygit"

  # Editor
  abbr l "lvim"
  abbr c "cat"

  # Docker
  abbr dd "lazydocker"
  abbr d "docker"
  abbr dc "docker container"
  abbr dim "docker image"
  abbr din "docker inspect"
  abbr dcc "docker compose"

  # Podman
  abbr p "podman"
  abbr pmi "podman machine init"
  abbr pms "podman machine start"
  abbr pc "podman container" 
  abbr pim "podman image"
  abbr pin "podman inspect"
  abbr pcc "podman compose"

  # Tf abbreviations
  abbr tf "terraform"
  abbr tfa "terraform apply"
  abbr tfp "terraform plan"
  abbr tff "terraform fmt"
  abbr tfi "terraform init"

  # Uv is a rust project to manage python packages
  abbr py "python"
  alias pip "uv pip"
  alias venv "uv venv"

  # ansible abbreviations
  abbr a "ansible"
  abbr ap "ansible-playbook"
  abbr ag "ansible-galaxy"

  if test -z $TMUX_SOCKET
    tmux
  end

end

