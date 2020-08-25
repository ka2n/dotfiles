let g:deoplete#enable_at_startup = 1
let s:deoplete_custom_option = {
    \ 'auto_complete_delay': 0,
    \ 'auto_refresh_delay': 20,
    \ 'camel_case': v:false,
    \ 'ignore_case': v:true,
    \ 'smart_case': v:true,
    \ 'max_list': 500,
    \ 'min_pattern_length': 1,
    \ 'num_processes': 4,
    \ 'on_insert_enter': v:true,
    \ 'on_text_changed_i': v:true,
    \ 'refresh_always': v:true,
    \ 'skip_chars': ['(',')'],
\ }
call deoplete#custom#option(s:deoplete_custom_option)

