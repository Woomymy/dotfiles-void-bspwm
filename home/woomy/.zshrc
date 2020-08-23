# Woomy - ZSHRC
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$HOME/.cargo/bin:$HOME/bin/path:/usr/local/bin:$PATH
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
# Loads node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

plugins=(node sudo git)

source $ZSH/oh-my-zsh.sh # Launch Oh-My-ZSH

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

export ARCHFLAGS="-arch x86_64"


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # Launchs P10K
########## ALIASES #########
alias gamemode="bash ${HOME}/bin/various/perf.sh"
