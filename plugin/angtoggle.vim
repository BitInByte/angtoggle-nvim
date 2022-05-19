if exists('g:loaded_angtoggle') | finish | endif " prevent loading file twice

if !has('nvim')
    echohl Error
    echom 'Sorry this plugin only works with versions of neovim that support lua'
    echohl clear
    finish
endif

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" command to run our plugin
command! -nargs=+ Angtoggle lua require'angtoggle'.load_command(<f-args>)

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_angtoggle = 1
