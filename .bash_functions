weather() { curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; }

function cdl() {
    cd "$1" && ls
}

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

function r() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" "$@"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$(pwd)" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# function r() {
#     temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
#     if [ -n "$TMUX" ]; then
#         # If inside tmux, open ranger in a popup
#         tmux popup -w90% -h90% -E "ranger --choosedir='$temp_file' '$@'"
#     else
#         # If not in tmux, open ranger normally
#         ranger --choosedir="$temp_file" "$@"
#     fi
#     if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$(pwd)" ]; then
#         cd -- "$chosen_dir"
#     fi
#     rm -f -- "$temp_file"
# }

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
