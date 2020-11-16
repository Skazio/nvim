" ================================= "nvim" =================================== "
" ============================= "Configuration" ============================== "
" ====================== "~/{config}/nvim/ginit.vim" ========================= "


" ============================================================================ "
" ================================ "Basique" ================================= "
" ============================================================================ "
" Execute GuiFont en version silencieuse (!: supprime les messages d'erreur) car
" sur Windows, le chargement des polices affiche un message concernant les
" "pitch metrics".
" Utilise la police Consolas (utile pour le plug-in "ryanoasis/vim-devicons").
execute "GuiFont! Consolas NF:h11"

" Désactive les pop-up Windows pour les remplacer par les pop up nvim.
GuiPopupmenu 0

" Désactive les tab Windows pour les remplacer par les tabs de nvim.
GuiTabline 0

