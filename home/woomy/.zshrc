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

# User aliases







function echotofile {
	if [[ -z $1 || -z $2 ]]
	then
		echo -e "\e[91mPlease specify a text and a file!"
		echo ""
		return;
	fi
	if [[ ! -f $2 ]] 
	then
		touch $2
	fi
	if [[ $3 == "yes" ]]
	then
		echo $1 | sudo tee -a $2
	else
		echo "$1" | tee -a $2
	fi
}
