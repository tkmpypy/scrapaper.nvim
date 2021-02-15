if exists('g:loaded_scrapaper') || !has('nvim')
 finish
endif

command! -nargs=0 -bang Scrapaper call luaeval('require("scrapaper").run()')
command! -nargs=1 -bang ScrapaperWithTitle call luaeval('require("scrapaper").run_with_title(<f-args>)')
