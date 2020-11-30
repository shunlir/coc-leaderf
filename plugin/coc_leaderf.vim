let g:Lf_Extensions = {
            \ "CocLoc": {
            \       "source": "coc_leaderf#location#run",
            \       "arguments": [
            \       ],
            \       "accept": "coc_leaderf#location#accept",
            \       "preview": "coc_leaderf#location#preview",
            \       "supports_name_only": 1,
            \       "get_digest": "coc_leaderf#location#get_digest",
            \       "highlights_def": {
            \               "Lf_hl_grep_file": '^.\{-}\ze\t',
            \               "Lf_hl_grep_line": '\t|\zs\d\+\ze|\t',
            \       },
            \       "highlights_cmd": [
            \               "hi Lf_hl_grep_file guifg=red ctermfg=196",
            \               "hi Lf_hl_grep_line guifg=green ctermfg=120",
            \       ],
            \       "highlight": "coc_leaderf#location#highlight",
            \       "bang_enter": "coc_leaderf#location#do_nothing",
            \       "after_enter": "coc_leaderf#location#after_enter",
            \       "before_exit": "",
            \       "supports_multi": 0,
            \ },
            \}

