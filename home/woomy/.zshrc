if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="/home/woomy/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
plugins=(git sudo node)

source $ZSH/oh-my-zsh.sh
export EDITOR="vim"
export ARCHFLAGS="-arch x86_64"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh