# This is intended to be used with oh-my-zsh


# ${(%):-%M}
# This has a (%) flag to instruct zsh to process any prompt escapes found in the expansion.
# This turns into a fancy way of getting the host name that would appear in the prompt using the %m escape
HOSTNAME=${(%):-%m}
DATE=${(%):-%D}
TIME=${(%):-%*}


ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

function git_prompt_info () {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX "
}

function get_pwd () {
	echo "${PWD/#$HOME/~}"
}

function get_home_rprompt () {

	echo "$fg[red]%B${${HOSTNAME}/IMAC/➤➤➤➤➤➤➤➤➤➤ SERVER}%b"
}

function get_spacing () {

	local width;
	(( width=${COLUMNS} - ${#${DATE}} - 1 - ${#${TIME}} - ${#${USER}} - 3 - ${#${HOSTNAME}} - 3 - ${#$(get_pwd)} - ${#$(git_prompt_info)} - ${#$(get_home_rprompt)} ))

	local spacing=""
	for i in {1..$width}; do
		spacing="${spacing}."
	done

	echo "$spacing ";
}


TY_PROMPT='$fg[yellow]⤹ $fg[yellow]%D %* $fg[cyan]%n $fg[red]@ $fg[green]%B%m%b $fg[red]: $fg[white]$(get_pwd) $fg[blue]$(get_spacing) $(git_prompt_info)'

TY_PROMPT2='
$fg[yellow]⤷ $reset_color'

TY_RPROMPT="$(get_home_rprompt)"

export PROMPT="
$TY_PROMPT$TY_RPROMPT$TY_PROMPT2"

