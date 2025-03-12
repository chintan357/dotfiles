function R() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    if [ -n "$TMUX" ]; then
        # If inside tmux, open ranger in a popup
        tmux popup -w90% -h90% -E "ranger --choosedir='$temp_file' '$@'"
    else
        # If not in tmux, open ranger normally
        ranger --choosedir="$temp_file" "$@"
    fi
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$(pwd)" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# weather() { curl wttr.in/"$1"; }
weather() { curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; }

dict() { curl "dict.org/d:$1"; }

function cdl() {
    cd "$1" && ls
}

function countdown() {
	total=$1
	for ((i = total; i > 0; i--)); do
		sleep 1
		printf "Time remaining $i secs \r"
	done
	echo -e "\a"
}

alias countdown=countdown

function extract() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2) tar xvjf $1 ;;
		*.tar.gz) tar xvzf $1 ;;
		*.tar.xz) tar Jxvf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.rar) rar x $1 ;;
		*.gz) gunzip $1 ;;
		*.tar) tar xvf $1 ;;
		*.tbz2) tar xvjf $1 ;;
		*.tgz) tar xvzf $1 ;;
		*.zip) unzip -d $(echo $1 | sed 's/\(.*\)\.zip/\1/') $1 ;;
		*.Z) uncompress $1 ;;
		*.7z) 7z x $1 ;;
		*) echo "don't know how to extract '$1'" ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}
alias extract=extract

urlencode() {
	local args="$@"
	jq -nr --arg v "$args" '$v|@uri'
}

duckduckgo() {
	lynx "https://lite.duckduckgo.com/lite/?q=$(urlencode "$@")"
}
alias ?='duckduckgo'

function stack() {
  local query=$(echo "$@" | tr ' ' '+')
    xdg-open "https://stackoverflow.com/search?q=$query"
}

function open() {
  if [[ -n "$1" ]]; then
    xdg-open "https://$1"
  else
    echo "Usage: open <path or URL>"
      fi
}

function google() {
  local query=$(echo "$*" | tr ' ' '+')
    xdg-open "https://www.google.com/search?q=$query"
}

function yt() {
  local query=$(echo "$*" | tr ' ' '+')
    if [[ -n "$query" ]]; then
      xdg-open "https://www.youtube.com/results?search_query=$query"
    else
      xdg-open "https://www.youtube.com"
        fi
}

function github() {
  if [[ -n "$1" ]]; then
    xdg-open "https://github.com/search?q=$1"
  else
    xdg-open "https://www.github.com"
      fi
}

function hl() {
  if command -v "$1" &> /dev/null; then
    if alias "$1" &>/dev/null; then
      echo "Cannot display help for alias: $1" >&2
    else
      "$@" --help | less
        fi
  else
    echo "Invalid command: $1" >&2
      fi
}

# # Outputs the name of the current branch
# # Usage example: git pull origin $(git_current_branch)
# # Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# # it's not a symbolic ref, but in a Git repo.
# function git_current_branch() {
#   local ref
#   ref=$(git --no-optional-locks symbolic-ref --quiet HEAD 2> /dev/null)
#   local ret=$?
#   if [[ $ret != 0 ]]; then
#     [[ $ret == 128 ]] && return  # no git repo.
#     ref=$(git --no-optional-locks rev-parse --short HEAD 2> /dev/null) || return
#   fi
#   echo ${ref#refs/heads/}
# }
#
# # Pass the prefix and suffix as first and second argument
# # Example: git_prompt_info [ ]
# function git_prompt_info() {
#   # If we are on a folder not tracked by git, get out.
#   if !git --no-optional-locks rev-parse --git-dir &> /dev/null; then
#     return 0
#   fi
#
#   local ref
#   ref=$(git --no-optional-locks symbolic-ref --short HEAD 2> /dev/null) \
#   || ref=$(git --no-optional-locks describe --tags --exact-match HEAD 2> /dev/null) \
#   || ref=$(git --no-optional-locks rev-parse --short HEAD 2> /dev/null) \
#   || return 0
#
#   echo "$1${ref:gs/%/%%}$(git_dirty_info "*")$2"
# }
#
# # Checks if working tree is dirty
# # The argument passed in is printed when dirty
# # Example: git_dirty_info "*"
# function git_dirty_info() {
#   local STATUS
#   STATUS=$(git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)
#   if [[ -n $STATUS ]]; then
#     echo $1
#   fi
# }

# function go() {
#   case "$1" in
#     config) pushd ~/.config ;;
#     tmp) pushd ~/trash ;;
#     # ... other directories ...
#     *) echo "Invalid directory: $1" ;;
#   esac
# }

# function pipupall {
#   # non-GNU xargs does not support nor need `--no-run-if-empty`
#   local xargs="xargs --no-run-if-empty"
#   xargs --version 2>/dev/null | grep -q GNU || xargs="xargs"
#   pip list --outdated | awk 'NR > 2 { print $1 }' | ${=xargs} pip install --upgrade
# }
# 
# function pipunall {
#   # non-GNU xargs does not support nor need `--no-run-if-empty`
#   local xargs="xargs --no-run-if-empty"
#   xargs --version 2>/dev/null | grep -q GNU || xargs="xargs"
#   pip list --format freeze | cut -d= -f1 | ${=xargs} pip uninstall
# }
# 
# function pipig {
#   pip install "git+https://github.com/$1.git"
# }
# 
# function pipigb {
#   pip install "git+https://github.com/$1.git@$2"
# }
# 
# function pipigp {
#   pip install "git+https://github.com/$1.git@refs/pull/$2/head"
# }
#
# ripgrep->fzf->vim [QUERY]
# rfv() (
#   RELOAD='reload:rg --column --color=always --smart-case {q} || :'
#   OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
#             vim {1} +{2}     # No selection. Open the current line in Vim.
#           else
#             vim +cw -q {+f}  # Build quickfix list for the selected items.
#           fi'
#   fzf --disabled --ansi --multi \
#       --bind "start:$RELOAD" --bind "change:$RELOAD" \
#       --bind "enter:become:$OPENER" \
#       --bind "ctrl-o:execute:$OPENER" \
#       --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
#       --delimiter : \
#       --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
#       --preview-window '~4,+{2}+4/3,<80(up)' \
#       --query "$*"
# )

# function R() {
#     temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
#     ranger --choosedir="$temp_file" "$@"
#     if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$(pwd)" ]; then
#         cd -- "$chosen_dir"
#     fi
#     rm -f -- "$temp_file"
# }
# function gbmv() {
#   if [ $# -eq 1 ]; then
#     git branch -m "$1"
#   elif [ $# -eq 2 ]; then
#     git branch -m "$1" "$2"
#   fi
# }
# alias countdown='echo "Enter duration (minutes): "; read duration; sleep $(($duration * 60)); notify-send "Time’s up!"'
