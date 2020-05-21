# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ "$PIPENV_ACTIVE" != 1 ]]; then
	PROMPT='$FG[237]${(l.((${COLUMNS}))..─.)}%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.
$)%{$reset_color%} '
else
	PROMPT='  $FG[237]${(l.((${COLUMNS}-30))..─.)}%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.
$)%{$reset_color%} '
fi
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_purple='$FG[091]'
eval my_blue='$FG[022]'
eval my_orange='$FG[214]'

# right prompt

# if type "virtualenv_prompt_info" > /dev/null
# then
# 	RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
# else
# 	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
# fi
if [[ "$PIPENV_ACTIVE" == 1 ]]; then
	RPROMPT='$(virtualenv_prompt_info)$my_purple [pipenv]$my_orange ($(basename $PWD))%{$reset_color%}%'
fi

# Initialize when switching opening up new terminal / window
if [[ "$PIPENV_ACTIVE" != 1 ]]; then
	if [[ -a "$PWD/Pipfile" ]]; then
		export pipfile_dir="$PWD"
		pipenv shell
	fi
fi


# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
