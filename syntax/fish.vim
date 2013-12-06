if exists('b:current_syntax') && b:current_syntax == 'fish'
  finish
endif

syntax match fishComment /\v\#.*$/
syntax match fishShebang /\v\#!.*$/

syntax match fishSpecial /\\$/

syntax keyword fishKeyword begin function end
syntax keyword fishConditional if else switch
syntax keyword fishRepeat while for in
syntax keyword fishLabel case

syntax region fishSlice matchgroup=fishBracket start=/\v\[/ end=/\v\]/ contained contains=fishNumber,fishRange,fishCommandSubstitution,fishVar
syntax match fishNumber /\v\d+/ contained
syntax match fishRange /\v\.\./ contained

syntax match fishFlag /\v(^|\s)@<=-(\w|-|_)+>/
syntax match fishFlag /\v(^|\s)@<=--(\w|-|_)+>/
syntax match fishRedirect /\v%(\d?\>|\^|\>\>|\^\^)(\s*\&%(\d|-))?/

syntax match fishIdentifier /\$[[:alnum:]_]\+/ nextgroup=fishSlice

syntax match fishCharacter /\v\\[abefnrtv *?~%#(){}\[\]<>&;"']|\\[xX][0-9a-f]{1,2}|\\o[0-7]{1,2}|\\u[0-9a-f]{1,4}|\\U[0-9a-f]{1,8}|\\c[a-z]/
syntax match fishStatement /\v;\s*\zs\k+>/
syntax region fishCommandSubstitution matchgroup=fishParen start=/\v\(/ end=/\v\)/ contains=fishInnerCommand,fishStatement,fishFor,fishCommandSubstitution,fishFlag,fishRedirect,fishVar,fishQuote,fishSemicolon

syntax match fishStatement /\v;\s*\zs\k+>/

syntax match fishEscapeSingleQuote /\v(\\'|\\\\)/ contained
syntax match fishEscape /\\./

syntax region fishQuote start=/'/ end=/'/ skip=/\v\\'/ contains=fishEscapeSingleQuote
syntax region fishQuote start=/"/ end=/"/ skip=/\v\\"/ contains=fishIdentifier,fishEscape

syntax region fishLineContinuation matchgroup=fishStatement
            \ start='\v^\s*\zs\k+>' skip='\\$' end='$'
            \ contains=fishSpecial,fishIdentifier,fishString,fishCharacter,fishStatement,fishCommandSub

highlight default link fishComment Comment
highlight default link fishShebang Special
highlight default link fishSpecial Special
highlight default link fishKeyword Keyword
highlight default link fishConditional Conditional
highlight default link fishRepeat Repeat
highlight default link fishLabel Label
highlight default link fishIdentifier Identifier
highlight default link fishQuote String
highlight default link fishEscape Special
highlight default link fishEscapeSingleQuote Special
highlight default link fishCommandSub fishStatement
highlight default link fishNumber Character
highlight default link fishCharacter Character
highlight default link fishStatement Statement

if !exists('b:current_syntax')
  let b:current_syntax = 'fish'
endif
