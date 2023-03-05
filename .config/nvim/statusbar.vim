function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
function! CurrentDir()
    return system("dirs | tr -d '\n'")
endfunction

hi GitStatus guifg=#fabd2f
hi GitStatus guibg=#3c3836
set statusline=
set statusline+=%#GitStatus#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=\ %y
set statusline+=%m
set statusline+=%=
set statusline+=\%{CurrentDir()}\ 
set statusline+=%#CursorColumn#
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ 
