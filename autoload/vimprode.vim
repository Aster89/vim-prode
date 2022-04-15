vim9script noclear
# name vim-prode? (prode = prefix mode?)

export def Driver(str: dict<any>): void
  redrawstatus!
  exe 'echohl ' .. g:vimprode_style
  echo str.prefix
  call getcharstr()
  #let columns = &columns
  #try
  #  echo s:make_status_line(expand('%'), columns)
  #  let key = ''
  #  while key !=# "\<Esc>"
  #    let [key, l:count] = s:get_count_and_key(g:Winzoz_getchar)
  #    let key = s:one_more_key_after_g(g:Winzoz_getchar, key)
  #    execute "normal! \<c-w>" . l:count . key
  #    echo ''
  #    redrawstatus!
  #    echo s:make_status_line(expand('%'), columns)
  #  endw
    echo ''
    redrawstatus!
  #finally
    echohl None
  #endtry
enddef

var ctrl_map = {
      \ "\<C-G>": "g",
      \ "\<C-H>": "h",
      \ "\<C-J>": "j",
      \ "\<C-K>": "k",
      \ "\<C-L>": "l",
      \ "\<C-N>": "n",
      \ "\<C-S>": "s",
      \ "\<C-V>": "v",
      \ "\<C-W>": "w",
      \ "\<C-X>": "x",
      \ }

export def StripCtrl(key: string): string
  if has_key(ctrl_map, key)
    return ctrl_map[key]
  else
    return key
  endif
enddef

export def GetCountAndKey(GetKey: func): list<string>
  var count = ""
  var key = StripCtrl(GetKey())
  while key =~ "[0-9]"
    count ..= key
    key = GetKey()
  endwhile
  return [key, count]
enddef
