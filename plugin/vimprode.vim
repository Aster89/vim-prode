vim9script noclear

import autoload 'vimprode.vim' as xyz

if exists("g:loaded_vimprode")
  finish
endif
g:loaded_vimprode = 1

g:vimprode_style = 'Search'

g:Funny = xyz.Driver

#g:StripCtrl = xyz.StripCtrl
#g:GetCountAndKey = xyz.GetCountAndKey



# for now, I can put this in the vimrc
#nnoremap <unique> <Leader>a :call Funny(#{prefix: "w"})<CR>
