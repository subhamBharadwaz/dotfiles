export ZSH="$HOME/.oh-my-zsh"


#source $ZSH/oh-my-zsh.sh




# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(git
	zsh-autosuggestions
	zsh-syntax-highlighting
  sudo
  copypath
  copyfile
  copybuffer
  dirhistory
  you-should-use
  zsh-bat
	)


source $ZSH/oh-my-zsh.sh

# Automatically start TMUX, if it's not set
if [[ -z "$TMUX" ]]; then
  tmux new-session -A -s main
fi


# Launch fetch-master-600 on terminal lunch
fm6000 -c "cyan" -asok -m 8 -g 12 -l 25
# bun completions
[ -s "/home/werewolf/.bun/_bun" ] && source "/home/werewolf/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go



# lazydocker
export PATH="$HOME/.local/bin:$PATH"


# zellij
#eval "$(zellij setup --generate-auto-start zsh)"

# Setup fzf key bindings and fuzzy completion
source <(fzf --zsh)

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# fzf catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# alias
alias lzd='lazydocker'
alias air='$(go env GOPATH)/bin/air'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"


fpath+=${ZDOTDIR:-~}/.zsh_functions


export PATH="$PATH:/opt/nvim-linux64/bin"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"


# Export all the known keymaps with prefix CTRL-g so it can be mapped in tmux
export FZF_GIT_BINDKEYS=$(bindkey -p '^g')

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# Bat (better cat)
export BAT_THEME="Catppuccin Mocha"

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Zoxide (better cd)
eval "$(zoxide init --cmd cd zsh)"


eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
