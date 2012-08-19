let g:sqlutil_load_default_maps = 0
let g:sqlutil_align_where = 1
let g:sqlutil_align_comma = 1
let g:sqlutil_keyword_case = '\U'
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>s
