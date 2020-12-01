function! coc_leaderf#location#run(args) abort
  let g:coc_leaderf_cur_symbol = expand("<cword>")
  let locs = deepcopy(get(g:, 'coc_jump_locations', ''))
  return s:get_location(locs)
  endfunction

function! s:format_coc_location(item) abort
  " in:  'filename' |'lnum' | 'col'| 'text'
  " out: 'filename':'lnum':'col':'text'
  let cwd = getcwd()
  let filename = substitute(a:item.filename, l:cwd . "/", "", "")
  return  filename .
        \ printf(':%d:%d:', a:item.lnum, a:item.col) .
        \ a:item.text
endfunction

function! s:get_location(locs) abort
  let locs = a:locs
  return map(locs, 's:format_coc_location(v:val)')
endfunction

function! coc_leaderf#location#format_line(line, args)
    return line
endfunction

function! coc_leaderf#location#accept(line, args) abort
    let items = split(a:line, ':')
    let file = items[0]
    let line = items[1]
    let col = items[2]
    exec "edit +".line." ".file
    norm! zz
    call cursor(line, col)
    setlocal cursorline!
    redraw
    sleep 100m
    setlocal cursorline!
endfunction

function! coc_leaderf#location#preview(orig_buf_nr, orig_cursor, line, args) abort
    let items = split(a:line, ':')
    let file = items[0]
    let line_num = items[1]
    return [file, line_num, ""]
endfunction

function! coc_leaderf#location#highlight(args) abort
    let ids = []
    call add(ids, matchadd("Lf_hl_rgHighlight", g:coc_leaderf_cur_symbol, 10))
    return ids
endfunction

function! coc_leaderf#location#get_digest(line, mode) abort
    " full path, i.e, the whole line
    if a:mode == 0
        return [a:line, 0]
    " name only, i.e, the part of file name
    elseif a:mode == 1
        return [split(a:line)[0], 0]
    " directory, i.e, the part of greped line
    else
        let items = split(a:line, '\t')
        return [items[2], len(a:line) - len(items[2])]
    endif
endfunction

function! coc_leaderf#location#do_nothing(orig_buf_nr, orig_cursor, args) abort
endfunction

function! coc_leaderf#location#after_enter(orig_buf_nr, orig_cursor, args) abort
  call matchadd('Lf_hl_rgFileName', '^.\{-}\ze\:\d\+:', 10)
  call matchadd('Lf_hl_rgLineNumber', '^.\{-}\zs:\d\+:', 10)
endfunction
