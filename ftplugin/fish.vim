" Use the 'j' format option when available.
if v:version ># 703 || v:version ==# 703 && has('patch541')
    setlocal formatoptions+=j
endif

let b:match_words =
      \ escape('<%(begin|function|if|switch|while|for)>:<end>', '<>%|)')

let b:endwise_addition = 'end'
let b:endwise_words = 'begin,function,if,switch,while,for'
let b:endwise_syngroups = 'fishKeyword,fishConditional,fishRepeat'
