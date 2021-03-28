function! s:load_package()
  try
    return json_decode(readfile("./package.json"))
  catch
    return {}
  endtry
endfunction

function! s:has_zenn()
  let l:package = s:load_package()
  return get(get(l:package, "dependencies", {}), "zenn-cli", '') !=# ''
endfunction

function! zenn_autocmd#do()
  if s:has_zenn()
    doautocmd User ZennEnter
  else
    doautocmd User ZennLeave
  endif
endfunction

function! s:doautocmd(event)
  let zenn_autocmd#event = a:event
  call zenn_autocmd#do()
endfunction

function! zenn_autocmd#enable()
  augroup zenn_autocmd#augroup
    autocmd!
    autocmd DirChanged * call s:doautocmd(deepcopy(v:event))
    autocmd User ZennEnter echo ''
    autocmd User ZennLeave echo ''
  augroup end
endfunction
