if status is-interactive
  # Commands to run in interactive sessions can go here
  direnv hook fish | source
  zoxide hook fish | source
  fzf --fish | source
  gh completion -s fish
  if set -q $TMUX_SOCKET
    tmux
  end

  if set -q $BW_SESSION
    bw login | awk 'NR==4 {print $1 }'
  end 

  fish_add_path $HOME/.local/share/nvm/v23.3.0/bin/
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
  abbr c "bat"
  abbr dd "lazydocker"
  abbr dc "docker"
  abbr dc "docker compose"
  abbr dci "docker image"
  abbr dcct "docker image"

  abbr py "python"
  abbr l "lvim"
  abbr c "cat"

  # Tf abbreviations
  abbr tf "terraform"
  abbr tfa "terraform apply"
  abbr tfp "terraform plan"
  abbr tff "terraform fmt"
  abbr tfi "terraform init"

end

