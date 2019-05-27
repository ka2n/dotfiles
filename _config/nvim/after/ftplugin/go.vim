setlocal noexpandtab nolist tabstop=2 shiftwidth=2 softtabstop=2 nofoldenable
highlight goErr cterm=bold ctermfg=214
match goErr /\<err\>/
setlocal omnifunc=LanguageClient#complete

nnoremap <buffer><Space>i :<C-u>Denite go_import -auto-preview<CR>
nnoremap <buffer><Leader>gt :<C-u>GoTestFunc<CR>
nnoremap <buffer><Leader>gi :<C-u>GoInfo<CR>
nnoremap <buffer><Leader>gn :<C-u>GoSameIds<CR>
