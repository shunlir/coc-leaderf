augroup CocLeaderFLocation
  autocmd!
  if has('nvim')
    let g:coc_enable_locationlist = 0
    autocmd User CocLocationsChange nested :Leaderf CocLoc
  endif
augroup END
