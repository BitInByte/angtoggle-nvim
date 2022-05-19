if exists('g:loaded_angtoggle') 
    finish 
endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" command to run our plugin
command! Angtoggle lua require'angtoggle'.load_command()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_angtoggle = 1
