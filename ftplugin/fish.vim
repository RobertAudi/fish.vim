setlocal comments=:#
setlocal commentstring=#%s

" Use the 'j' format option when available.
if v:version ># 703 || v:version ==# 703 && has('patch541')
    setlocal formatoptions+=j
endif

if executable('fish')
  setlocal omnifunc=fish#Complete
  for s:path in split(system("fish -c 'echo $fish_function_path'"))
    execute 'setlocal path+='.s:path
  endfor
endif

let b:match_words =
      \ escape('<%(begin|function|if|switch|while|for)>:<end>', '<>%|)')

let b:endwise_addition = 'end'
let b:endwise_words = 'begin,function,if,switch,while,for'
let b:endwise_syngroups = 'fishKeyword,fishConditional,fishRepeat'
