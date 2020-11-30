augroup CocLeaderFLocation
  autocmd!
  if has('nvim')
    let g:coc_enable_locationlist = 0
    autocmd User CocLocationsChange :Leaderf CocLoc
  endif
augroup END
