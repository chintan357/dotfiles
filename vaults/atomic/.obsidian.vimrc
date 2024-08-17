unmap ,

nmap ; :
"nmap : ;

nmap <esc> :nohl
nmap j gj
nmap k gk
nmap L $

set clipboard=unnamed
set tabstop=2

nnoremap Y y$

exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nnoremap <BS> :goBack
nnoremap <S-BS> :goForward
"nmap <C-o> :back
"nmap <C-i> :forward


exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets


" Maps pasteinto to Alt-p
"map <A-p> :pasteinto


" Folding
""""""""""""""""""""""
exmap togglefold obcommand editor:toggle-fold
nnoremap zo :togglefold

exmap unfoldall obcommand editor:unfold-all
nnoremap zr :unfoldall
"nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nnoremap zm :foldall
"nmap zM :foldall


" mapping next/previous heading
"exmap nextHeading jsfile .obsidian.markdown-helper.js {jumpHeading(true)}
"exmap prevHeading jsfile .obsidian.markdown-helper.js {jumpHeading(false)}
"nmap g] :nextHeading
"nmap g[ :prevHeading
"exmap nextHeading jsfile mdHelpers.js {jumpHeading(true)}
"exmap prevHeading jsfile mdHelpers.js {jumpHeading(false)}
"nmap ]] :nextHeading
"nmap [[ :prevHeading


" g; go to last change - https://vimhelp.org/motion.txt.html#g%3B
nmap g; u<C-r>

"exmap scrollToCenterTop70p jsfile .obsidian.markdown-helper.js {scrollToCursor(0.7)}
"nmap zz :scrollToCenterTop70p

" rename file

" mapping vs/hs as workspace split
exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-vertical
exmap hs obcommand workspace:split-horizontal

" window controls
exmap q obcommand workspace:close

" focus
exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
nmap <C-h> :focusLeft
nmap <C-l> :focusRight
nmap <C-j> :focusBottom
nmap <C-k> :focusTop

" complete a Markdown task
exmap toggleTask obcommand editor:toggle-checklist-status
nmap ,x :toggleTask

" Zoom in/out
exmap zoomIn obcommand obsidian-zoom:zoom-in
exmap zoomOut obcommand obsidian-zoom:zoom-out
"nmap zi :zoomIn
"nmap zo :zoomOut

" Stille Mode
exmap toggleStille obcommand obsidian-stille:toggleStille
nmap zs :toggleStille
nmap ,s :toggleStille


" don't pollute the register (HACK since we can't map to `"_x` or `"_C`)
nnoremap C "_c$
nnoremap x "_dl
nnoremap c "_c " BUG not working with vimrc plugin

" Navigation
""""""""""""""""""""""

" HJKL behaves like hjkl, but bigger distance
vnoremap J 6j
vnoremap K 6k

" dj = delete 2 lines, dJ = delete 3 lines
onoremap J 2j

" Jumps
"nnoremap <C-h> <C-o>
"nnoremap <C-l> <C-i>

" [z]pelling [l]ist (emulates `z=`)
"exmap contextMenu obcommand editor:context-menu
"nnoremap zl :contextMenu

" next diagnostic
"exmap nextSuggestion obcommand obsidian-languagetool-plugin:ltjump-to-next-suggestion
"nnoremap ge :nextSuggestion
"vnoremap ge :nextSuggestion

" INFO doesn't work in reading mode: https://github.com/timhor/obsidian-editor-shortcuts/issues/20
exmap nextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
exmap prevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
"nnoremap <C-j> :nextHeading
"nnoremap <C-k> :prevHeading

" INFO doesn't work in visual mode
exmap lineUp obcommand editor:swap-line-up
exmap lineDown obcommand editor:swap-line-down
nnoremap <Up> :lineUp
nnoremap <Down> :lineDown
nnoremap <Right> dlp
nnoremap <Left> dlhhp

exmap openlink obcommand editor:open-link-in-new-leaf
nmap go :openlink
nmap gd :openlink

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor

" Link Jump (similar to Vimium's f)
exmap linkjump obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap ,f :linkjump

" [g]oto [s]ymbol via "Another Quick Switcher" Plugin
"exmap gotoHeading obcommand obsidian-another-quick-switcher:header-floating-search-in-file
"nnoremap gs :gotoHeading

" [g]oto [w]riting chapters
"exmap gotoScene obcommand longform:longform-jump-to-scene
"nnoremap gw :gotoScene

" [g]oto definition / link (shukuchi makes it forward-seeking)
"exmap followNextLink obcommand shukuchi:open-link
"nnoremap gx :followNextLink
"nnoremap ga :followNextLink
"nnoremap gd :followNextLink

" [g]oto [o]pen file (= Quick Switcher)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:search-command_recent-search
nnoremap go :quickSwitcher
nnoremap gr :quickSwitcher

" Search
""""""""""""""""""""""
" Another Quick Switcher ripgrep-search
" somewhat close to Telescope's livegrep
exmap liveGrep obcommand obsidian-another-quick-switcher:grep
nnoremap gl :liveGrep

" Obsidian builtin Search & replace
exmap searchReplace obcommand editor:open-search-replace
nnoremap ,ff :searchReplace

" go to last change (HACK, only works to jump to the last location)
"nnoremap gc u<C-r>

" increment quicker
nnoremap + <C-a>
nnoremap - <C-x>


" Editing
""""""""""""""""""""""
" undo/redo consistently on one key
nnoremap U <C-r>

" redo all
nnoremap ,ur 1000<C-r>

" do not move to the right on toggling case
nnoremap ~ ~h

" Change Word/Selection
nnoremap <Space> "_ciw
onoremap <Space> iw
onoremap a<Space> iW

" Delete Word/Selection
nnoremap <S-Space> "_daw


" Add Blank Line above/below
nnoremap [<Space> mzO<Esc>`z
nnoremap ]<Space> mzo<Esc>`z


"exmap toggleDevtools obcommand obsidian-theme-design-utilities:toggle-devtools
"nnoremap ,b :toggleDevtools
"vnoremap ,b :toggleDevtools


" Markdown/Obsidian specific
""""""""""""""""""""""""""""
" [l]og commands in console
"nnoremap ,l :obcommand

" [g]oto [f]ootnotes
" requires Footnotes Shortcut Plugin
"exmap gotoFootnote obcommand obsidian-footnotes:insert-autonumbered-footnote
"nnoremap gf :gotoFootnote

" Blockquote
exmap toggleBlockquote obcommand editor:toggle-blockquote
nnoremap ,< :toggleBlockquote
nnoremap ,> :toggleBlockquote

" list
exmap toggleList obcommand editor:toggle-bullet-list
nnoremap ,- :toggleList

" markdown tasks
exmap checkList obcommand editor:toggle-checklist-status
nnoremap ,x :checkList


" Visual Mode
""""""""""""""""""""""
vnoremap V gj
vnoremap v <C-v>


" Text Objects
""""""""""""""""""""""
" quicker access to [m]assive word, [q]uote, [z]ingle quote, inline cod[e],
" [r]ectangular bracket, and [c]urly braces
onoremap am aW
onoremap im iW
onoremap k i"
onoremap ae a`
onoremap ie i`

vnoremap am aW
vnoremap im iW
vnoremap ae a`
vnoremap ie i`


" Substitute
""""""""""""""""""""""
" poor man's substitute.nvim/duplicate.nvim:
" brut-forcing all possible text objects 💀
nunmap s
nnoremap ss Vp
nnoremap S vg$p
nnoremap sj vjp
nnoremap sim viWp
nnoremap sam vaWp
nnoremap siw viwp
nnoremap saw vawp
nnoremap sis visp
nnoremap sas vasp
nnoremap sip vipp
nnoremap sap vapp
nnoremap sib vi)p
nnoremap saq va"p
nnoremap siq vi"p
nnoremap sk vi"p
nnoremap saz va'p
nnoremap siz vi'p
nnoremap sae va`p
nnoremap sie vi`p
nnoremap sab va)p
nnoremap sir vi]p
nnoremap sar va]p
nnoremap sic vi}p
nnoremap sac va}p
nnoremap srg vGp
nnoremap sgg vggGp

nunmap w
exmap duplicate obcommand obsidian-editor-shortcuts:duplicateLine
nnoremap ww :duplicate

nnoremap W y$$p
nnoremap wj yjjp
nnoremap wim yiWp
nnoremap wam yaWp
nnoremap wiw yiwp
nnoremap waw yawp
nnoremap wis yisp
nnoremap was yasp
nnoremap wip yipp
nnoremap wap yapp
nnoremap wib yi)p
nnoremap waq ya"p
nnoremap wiq yi"p
nnoremap wk yi"p
nnoremap waz ya'p
nnoremap wiz yi'p
nnoremap wae ya`p
nnoremap wie yi`p
nnoremap wab ya)p
nnoremap wir yi]p
nnoremap war ya]p
nnoremap wic yi}p
nnoremap wac ya}p
nnoremap wrg yGp


" Tabs, Splits & Alt-file
""""""""""""""""""""""
" Close
exmap closeWindow obcommand workspace:close-window
nnoremap ZZ :closeWindow

" Splits
exmap splitVertical obcommand workspace:split-vertical
nnoremap <M-|> :splitVertical


" Tabs
""""""""""""""""""""""
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nnoremap gt :nextTab
nnoremap gT :prevTab


" Alt Buffer (emulates `:buffer #`)
exmap altBuffer obcommand grappling-hook:alternate-note
nnoremap <CR> :altBuffer


" Critic Markup
""""""""""""""""""""""
" accept all / selection
"exmap acceptAll obcommand commentator:commentator-accept-all-suggestions
"nnoremap ,a :acceptAll
"exmap acceptSelected obcommand commentator:commentator-accept-selected-suggestions
"vnoremap ,a :acceptAll

" reject all / selection
"exmap rejectAll obcommand commentator:commentator-reject-all-suggestions
"nnoremap ,A :rejectAll
"exmap rejectSelected obcommand commentator:commentator-reject-selected-suggestions
"vnoremap ,A :rejectAll


" Option Toggling
""""""""""""""""""""""
" [O]ption: [s]pellcheck
"exmap spellcheck obcommand editor:toggle-spellcheck
"nnoremap ,os :spellcheck

" [O]ption: [d]iagnostics
"exmap enableDiagnostics obcommand obsidian-languagetool-plugin:ltcheck-text
"nnoremap ,od :enableDiagnostics

"exmap disableDiagnostics obcommand obsidian-languagetool-plugin:ltclear
"nnoremap ,oD :disableDiagnostics
