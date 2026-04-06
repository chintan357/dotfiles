weather() { curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; }

cdl() {
    cd "$1" && ls
}


#urlencode() {
#	local args="$@"
#	jq -nr --arg v "$args" '$v|@uri'
#}

#duckduckgo() {
#	lynx "https://lite.duckduckgo.com/lite/?q=$(urlencode "$@")"
#}
#alias ?='duckduckgo'

stack() {
  local query=$(echo "$@" | tr ' ' '+')
    xdg-open "https://stackoverflow.com/search?q=$query"
}

pypi() {
  xdg-open "https://pypi.org/project/$1/"
}

google() {
  local query=$(echo "$*" | tr ' ' '+')
    xdg-open "https://www.google.com/search?q=$query"
}

yt() {
  local query=$(echo "$*" | tr ' ' '+')
    if [[ -n "$query" ]]; then
      xdg-open "https://www.youtube.com/results?search_query=$query"
    else
      xdg-open "https://www.youtube.com"
        fi
}

github() {
  if [[ -n "$1" ]]; then
    xdg-open "https://github.com/search?q=$1"
  else
    xdg-open "https://www.github.com"
      fi
}


# r() {
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
