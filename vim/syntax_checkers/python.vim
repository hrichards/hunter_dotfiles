" From: https://github.counsyl.com/gist/11
" Syntastic works out of the box with pyflakes, flake8, or pylint for python,
" but it filters the errors in a way we don't want. Putting this in
" ~/.vim/syntax_checkers/python.vim makes syntastic use codequality
" as the python checker and not filter the results.
function! SyntaxCheckers_python_GetLocList()
    let makeprg = 'codequality ' . shellescape(expand('%'))
    return SyntasticMake({ 'makeprg': makeprg })
endfunction
