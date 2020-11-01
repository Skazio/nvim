" ================================= "nvim" =================================== "
" ============================= "Configuration" ============================== "
" ======================= "~/{config}/nvim/init.vim" ========================= "
" TODO:
"   -vim-fugitive
"   -vim status bar (vim-airline)
"   -emmet

" ============================================================================ "
" ================================ "Basique" ================================= "
" ============================================================================ "
" Voir le fichier "~/{config}/nvim/ginit.vim" pour la configuration graphique.

" Utilise le bon encodage.
set encoding=UTF-8

" Permet d'activer la coloration syntaxique.
syntax on

" Désactive la compatibilité avec vi
set nocompatible

" Permet de détecter automatiquement le type de fichier, les règles
" d'indentation et les plugins associés à ce fichier.
filetype on
filetype indent on 
filetype plugin on

" Définit la touche leader.
let mapleader = " "

" Affiche une ligne au 81-unième caratère, permet de ne pas dépasser les 80
" caractères par ligne.
set colorcolumn=81


" ============================================================================ "
" ============================== "Sauvegarde" ================================ "
" ============================================================================ "
" Définit le nombre de ligne conservé en mémoire pour un buffer ouvert.
set history=10000
" Définit le nombre de undo sauvegardé.
set undolevels=10000
" Active les undo, même après la fermeture du fichier.
set undofile
" Définit l'emplacement des fichiers undo
set undodir=$XDG_CONFIG_HOME/nvim/undo

" Avant chaque écriture sur le disque, créer un fichier de backup de l'ancien
" fichier. En cas de problème, le fichier original peut être trouvé dans le
" backupsdir.
set writebackup
" Ne conserve pas les fichiers de backup (les supprime une fois le buffer écrit
" correctement sur le disque dur).
set nobackup
" L'emplacement des fichiers de backup. '.' signifie que le fichier de backup se
" trouve dans le même dossier que le fichier d'origine.
set backupdir=.


" ============================================================================ "
" ============================== "Status Bar" ================================ "
" ============================================================================ "
" Permet d'afficher le mode dans lequel on se trouve (Insertion, Visual, etc.).
set showmode

" Active l'autocomplétion dans la ligne de commande.
set wildmenu
" Déclanche l'autocomplétion grâce à la touche "<Tab>".
set wildchar=<Tab>


" ============================================================================ "
" =============================== "Formatage" ================================ "
" ============================================================================ "
" Définit la limite d'une ligne à 80 caractères lors du formatage "<gqq>".
set textwidth=80

" Désactive le wrapping de ligne (retour visuel à la ligne, lorsque celle-ci
" dépasse la limite de l'écran).
set nowrap

" Permet à la touche "<BS>" de supprimet les indentations, les fins de ligns, et
" les débuts de ligne
set backspace=indent,eol,start


" ============================================================================ "
" ================================ "Message" ================================= "
" ============================================================================ "
" Désactive les clignotements de l'écran (par exemple lors du scroll à droite en
" fin de fenêtre).
set noerrorbells


" ============================================================================ "
" ============================== "Indentation" =============================== "
" ============================================================================ "
" Définit la longueur d'une tabulation à 2 caractères d'espacement.
set tabstop=2 softtabstop=2
" Définit la longueur d'une indentation de code.
set shiftwidth=2
" Tous les caratères de tabulation sont remplacés par des caractères "<Space>".
set expandtab
" Essaye de créer la bonne indentation (lors des retours à la ligne "<Enter>",
" "<o>", "<O>", etc.).
set noautoindent
set smartindent


" ============================================================================ "
" ================================= "Marge" ================================== "
" ============================================================================ "
" Active les nombres relatifs dans la marge.
set number relativenumber

" Active le groupe de commandes executées automatiquement "numbertoogle".
" Cela permet :
"   -L'activation du mode "number" en Insertion.
"   -L'activation du mode "relativenumber" en mode Normal.
augroup numbertoogle
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup end

 
" ============================================================================ "
" =============================== "Recherche" ================================ "
" ============================================================================ "
" Ignore la casse lors des recherches.
set ignorecase
" N'ignore plus la casse si une lettre majuscule est rencontrée dans le motif de
" recherche.
set smartcase
" Affiche au fur et à mesure de la recherche les motifs reconnus.
set incsearch


" ============================================================================ "
" ================================= "Remap" ================================== "
" ============================================================================ "
" Permet d'avoir le même comportement avec "<C-c>" qu'avec "<Escap>".
inoremap <C-C> <Esc>

" Permet d'ouvrir le panneau latéral d'exploration de fichier.
nnoremap <Leader>b :call NerdTreeToggleCWD()<Cr>

" Permet d'insérer la date actuelle du système.
nmap <F3> i<C-R>=strftime("%A %d %B %Y, %H:%M - (%Y-%m-%d)")<Cr><Esc>
imap <F3> <C-R>=strftime("%A %d %B %Y, %H:%M - (%Y-%m-%d)")<Cr>

" Permet d'éditer le fichier de configuration de Nvim.
nnoremap <C-,> :e $MYVIMRC<Cr>

" Permet d'afficher le git status.
nnoremap <Leader>gs :G<Cr>
" Permet de selectionner la partie de gauche lors de la résolution de conflit de
" merge.
nnoremap <Leader>gq :diffget //2<Cr> 
" Permet de selectionner la partie de droite lors de la résolution de conflit de
" merge.
nnoremap <Leader>gm :diffget //3<Cr> 


" ============================================================================ "
" ================================ "Plugin" ================================== "
" ============================ "Initialisation" ============================== "
"call plug#begin('~/.vim/plugged')
call plug#begin('~/AppData/Local/nvim/plugged')

" Theme Gruvbox.
Plug 'morhetz/gruvbox'

" Panneau latéral d'exploration de fichiers.
Plug 'preservim/nerdtree'

" Associe à chaque élément du panneau latéral des icones.
Plug 'ryanoasis/vim-devicons'

" Permet de recherche des fichiers facilement en se basant sur leur nom.
Plug 'ctrlpvim/ctrlp.vim'

" Wrapper Git.
Plug 'tpope/vim-fugitive'

" Autocomplétion.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()


" ============================================================================ "
" ================================ "Plugin" ================================== "
" ============================== "Utilisation" =============================== "
" "gruvbox"
" Utilisation de gruvbox.
colorscheme gruvbox
set background=dark
set cursorline


" "NERDTree"
" Change les icones de NERDTree pour les dossiers ouverts / fermés.
let g:NERDTreeDirArrowExpandable="▸"
let g:NERDTreeDirArrowCollapsible="▾"

" Indique à NERDTree d'afficher les dossiers et fichiers cachés.
let g:NERDTreeShowHidden=1

" Indique à NERDTree de trier tous les fichiers cachéx au début.
let g:NERDTreeSortHiddenFirst=1

" Permet d'ouvrir NERDTree dans le CurrentWorkingDirectory (:pwd) s'il était
" fermé, ou bien de le fermer s'il était ouvert.
function NerdTreeToggleCWD()
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    NERDTreeClose
  elseif exists("g:NERDTree")
    NERDTreeCWD
  endif
endfunction


" "CtrlP"
" Lance la recherche dans le dossier de tavail actuel (:pwd).
let g:ctrlp_working_path_mode='w'
" Affiche les résultats en bas, de bas en haut, au minimum une ligne, au
" maximum 5 lignes, au maximum 5 résultats.
let g:ctrlp_match_window='bottom,order:btt,min:1,max:5,results:5'
" Execute la recherche également sur les dossiers et fichiers cachés.
let g:ctrlp_show_hidden=1
" Ajoute un préfix à la ligne selectionnée dans les résultats.
let g:ctrlp_line_prefix='> '


" "CoC"
" Installe le marketplace de Coc.
" "CocList marketplace" pour afficher le marché d'extension.
function CocInit()
  CocInstall coc-marketplace
endfunction

" Configuration de base.
" TextEdit might fail if hidden is not set.
" set hidden
" Pour l'instant je me vois très peu utiliser cette option; donc on vera les
" problèmes qui en découlent.
set nohidden

" En cas de problème, merge ces options avec mes configurations: "Sauvegarde".
" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Par défaut, Coc recommande 2.
" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" Je ne supporte pas que ça auto complète sur "<Cr>", il y a déjà "<Tab>" pour
" ça.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ?
      \ coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ?
      \ coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ?
      \ "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ?
      \ "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Les diagnostics sont en fait les messages: d'erreur, de warning, et
" d'information affiché dans la marge lors de l'édition d'un fichier.
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" TODO: Compris jusqu'ici.

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR
      \ :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline=

" Mappings for CoCList

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

