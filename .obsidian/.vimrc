unmap , " is this needed?

nnoremap ; :
nnoremap : ;

nmap <esc> :nohl
"nmap j gj
"nmap k gk

set clipboard=unnamedplus
set tabstop=2

nnoremap Y y$

exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nnoremap <BS> :goBack<CR>
nnoremap <S-BS> :goForward<CR>

" Folding
"exmap foldall obcommand editor:fold-all
"nnoremap zC :foldall<cr> "zM

"exmap unfoldall obcommand editor:unfold-all
"nnoremap zO :unfoldall<cr> "zR


" g; go to last change - https://vimhelp.org/motion.txt.html#g%3B
nmap g; u<C-r>

" window controls
exmap q obcommand workspace:close

" don't pollute the register (HACK since we can't map to `"_x` or `"_C`)
nnoremap C "_c$
"nnoremap x "_dl
"nnoremap c "_c " BUG not working with vimrc plugin

exmap openlink obcommand editor:open-link-in-new-leaf
nmap gd :openlink<CR>

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor<CR>

" Obsidian builtin Search & replace
"exmap searchReplace obcommand editor:open-search-replace
"nnoremap ,ff :searchReplace

" increment quicker
nnoremap + <C-a>
nnoremap - <C-x>

" undo/redo consistently on one key
nnoremap U <C-r>

" Add Blank Line above/below
nnoremap [<Space> mzO<Esc>`z
nnoremap ]<Space> mzo<Esc>`z

" Blockquote
exmap toggleBlockquote obcommand editor:toggle-blockquote
nnoremap ,< :toggleBlockquote<CR>
nnoremap ,> :toggleBlockquote<CR>

" list
exmap toggleList obcommand editor:toggle-bullet-list
nnoremap ,- :toggleList<CR>

" markdown tasks
exmap checkList obcommand editor:toggle-checklist-status
nnoremap ,x :checkList<CR>
" complete a Markdown task
"exmap toggleTask obcommand editor:toggle-checklist-status
"nmap ,x :toggleTask<CR>

" Visual Mode
vnoremap V gj
vnoremap v <C-v>

"nunmap w
"exmap duplicate obcommand obsidian-editor-shortcuts:duplicateLine
"nnoremap ww :duplicate

" Close
exmap closeWindow obcommand workspace:close-window
nnoremap ZZ :closeWindow<CR>

" Tabs
""""""""""""""""""""""
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nnoremap [t :prevTab<CR>
nnoremap ]t :nextTab<CR>

" mapping vs/hs as workspace split
exmap vs obcommand workspace:split-vertical
exmap hs obcommand workspace:split-horizontal

" Alt Buffer (emulates `:buffer #`)
"exmap altBuffer obcommand grappling-hook:alternate-note
"nnoremap <CR> :altBuffer


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

" mapping next/previous heading
"exmap nextHeading jsfile .obsidian.markdown-helper.js {jumpHeading(true)}
"exmap prevHeading jsfile .obsidian.markdown-helper.js {jumpHeading(false)}
"exmap nextHeading jsfile mdHelpers.js {jumpHeading(true)}
"exmap prevHeading jsfile mdHelpers.js {jumpHeading(false)}
"nmap g] :nextHeading
"nmap g[ :prevHeading
"nmap ]] :nextHeading
"nmap [[ :prevHeading

" INFO doesn't work in reading mode: https://github.com/timhor/obsidian-editor-shortcuts/issues/20
"exmap nextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
"exmap prevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
"nnoremap <C-j> :nextHeading
"nnoremap <C-k> :prevHeading

" Maps pasteinto to Alt-p
"map <A-p> :pasteinto

"exmap scrollToCenterTop70p jsfile .obsidian.markdown-helper.js {scrollToCursor(0.7)}
"nmap zz :scrollToCenterTop70p

" Stille Mode
"exmap toggleStille obcommand obsidian-stille:toggleStille
"nmap zs :toggleStille<CR>
"nmap ,s :toggleStille<CR>

" [z]pelling [l]ist (emulates `z=`)
"exmap contextMenu obcommand editor:context-menu
"nnoremap zl :contextMenu

" next diagnostic
"exmap nextSuggestion obcommand obsidian-languagetool-plugin:ltjump-to-next-suggestion
"nnoremap ge :nextSuggestion
"vnoremap ge :nextSuggestion

" INFO doesn't work in visual mode
"exmap lineUp obcommand editor:swap-line-up
"exmap lineDown obcommand editor:swap-line-down
"nnoremap <Up> :lineUp<CR>
"nnoremap <Down> :lineDown<CR>

" Link Jump (similar to Vimium's f)
"exmap linkjump obcommand mrj-jump-to-link:activate-lightspeed-jump
"nmap ,f :linkjump<CR>

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
"exmap quickSwitcher obcommand obsidian-another-quick-switcher:search-command_recent-search
"nnoremap go :quickSwitcher<CR>
"nnoremap gr

" Search
""""""""""""""""""""""
" Another Quick Switcher ripgrep-search
" somewhat close to Telescope's livegrep
"exmap liveGrep obcommand obsidian-another-quick-switcher:grep
"nnoremap gl :liveGrep

" redo all
" nnoremap ,ur 1000<C-r>

" do not move to the right on toggling case
"nnoremap ~ ~h

" Change Word/Selection
"nnoremap <Space> "_ciw
"onoremap <Space> iw
"onoremap a<Space> iW

" Delete Word/Selection
"nnoremap <S-Space> "_daw

"exmap toggleDevtools obcommand obsidian-theme-design-utilities:toggle-devtools
"nnoremap ,b :toggleDevtools
"vnoremap ,b :toggleDevtools


" Markdown/Obsidian specific
""""""""""""""""""""""""""""
" [l]og commands in console
" nnoremap ,l :obcommand

" [g]oto [f]ootnotes
" requires Footnotes Shortcut Plugin
"exmap gotoFootnote obcommand obsidian-footnotes:insert-autonumbered-footnote
"nnoremap gf :gotoFootnote

" go to last change (HACK, only works to jump to the last location)
"nnoremap gc u<C-r>
