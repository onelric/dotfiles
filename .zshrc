source "$HOME/.cargo/env"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="/usr/bin/alacritty"
export HIGHLIGHT_STYLE="base16/3024"

alias v="nvim"
alias ra="ranger"
alias st="spotify-tui"
alias f="sh $HOME/.config/kitty/sessions/launch_ranger.sh"

alias vzsh="nvim $HOME/.zshrc"
alias vnvim="nvim $HOME/.config/nvim"
alias vranger="nvim $HOME/.config/ranger/rc.conf"
alias vway="nvim $HOME/.config/waybar/"
alias vsway="nvim $HOME/.config/sway/"
alias valacritty="nvim $HOME/.config/alacritty/alacritty.toml"
alias vkitty="nvim $HOME/.config/kitty/"
alias vrofi="nvim $HOME/.config/rofi/config.rasi"
alias vqute="nvim $HOME/.config/qutebrowser/config.py"

ZSH_THEME="eastwood"

plugins=(
    git 
    vi-mode
    zsh-syntax-highlighting 
    zsh-autosuggestions
    zsh-eza
)
VI_MODE_SET_CURSOR=true

eza_params=('--git' '--icons' '--group-directories' '--color-scale' '--color-scale-mode=fixed')

alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

alias catnip="catnip -s ' ~>' -c 'green,red,yellow,cyan' -fcat"
alias cat="bat --theme=base16"
alias gitkey="wl-copy < ~/.gitkey"
alias push="gitkey ; git push"
alias screenshot='grim -g "$(slurp)" ~/screenshot-$(date +%d.%m.%y-%H:%M:%S).png'


bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

function ranger {
  local quit_cd_wd_file="$HOME/.cache/ranger/quit_cd_wd"
  command ranger --cmd="map q quitall_cd_wd $quit_cd_wd_file" "$@"
  if [ -s "$quit_cd_wd_file" ]; then
    cd "$(cat $quit_cd_wd_file)"
    true > "$quit_cd_wd_file"
  fi
}

source $ZSH/oh-my-zsh.sh

clear
catnip
