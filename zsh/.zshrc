# Zinit home location
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if not already installed
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source the zinit file
source "${ZINIT_HOME}/zinit.zsh"

# Env Vars
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.zig/zls/zig-out/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/usr/local/go/bin"

export ZDOTDIR="$HOME"
export EDITOR="helix"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ZSH plugins
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-autosuggestions
zi light Aloxaf/fzf-tab

# ZSH completions
zi ice as"completion"; zi snippet OMZP::docker/completions/_docker
zi ice as"completion"; zi snippet OMZP::docker-compose/_docker-compose
zi ice as"completion"; zi snippet "https://github.com/eza-community/eza/blob/main/completions/zsh/_eza"

# Usefull plugins
zi snippet OMZP::sudo
zi snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zi cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Alias
alias ls="eza --icons=auto"
alias lsnc="ls --color=never"
alias hx="helix"
alias rz="source $ZDOTDIR/.zshrc"
alias ez="$EDITOR $ZDOTDIR/.zshrc"

# Fzf with zsh
eval "$(fzf --zsh)"

# Zoxide with zsh
eval "$(zoxide init --cmd cd zsh)"

# Starship with zsh
eval "$(starship init zsh)" 

# Zellij starter script
ZJ_SESSIONS=$(zellij ls -n -s)
NUM_SESSIONS=$(zellij ls | wc -l)

if [[ -z "$ZELLIJ" ]]; then
  if (( $NUM_SESSIONS >= 2 )); then
    zellij attach "$(echo "$ZJ_SESSIONS" | fzf)"
  else 
    zellij a -c
  fi
fi

# -------------------------------------------- AUTOGENERATED CODE -------------------------------------------- #
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Turso
export PATH="$PATH:/home/bhuvansh/.turso"

# pnpm
export PNPM_HOME="/home/bhuvansh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
