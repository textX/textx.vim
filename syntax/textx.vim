if exists("b:current_syntax")
  finish
endif

syntax keyword textXKeyword
      \ import

syntax keyword textXParams
      \ eolterm
      \ ws
      \ skipws
      \ noskipws

" textX types
syntax keyword textXType
      \ BASETYPE
      \ ID
      \ NUMBER
      \ INT
      \ FLOAT
      \ STRING
      \ BOOL

syntax region textXString start=/"/ skip=/\\"/ end=/"/ oneline
syntax region textXString start=/'/ skip=/\\'/ end=/'/ oneline
syntax region textXRegEx start=/\// skip=/\\\// end=/\// oneline
syntax region textXParamsReg start="\[" end="\]"
      \ contains=textXParams,textXString,textXOperator


" Rules folding
syntax region textXRule start=/\v^\s*[A-Za-z0-9_]+\s*(\[.*\])?:/ end=';'
      \ contains=textXParams,textXParamsReg,textXString,textXRegEx,textXOperator,textXType,
      \ textXComment,textXVariable,textXAssignment,textXTodo fold


" Variables
syntax match textXVariable "\k\+\s*\(=\|+=\|*=\|?=\)\@="

" Assignments
syntax match textXAssignment "\v\="
syntax match textXAssignment "\v\+\="
syntax match textXAssignment "\v\*\="
syntax match textXAssignment "\v\?\="


" Operators
syntax match textXOperator "\v\="
syntax match textXOperator "\v\+"
syntax match textXOperator "\v\*"
syntax match textXOperator "\v\?"
syntax match textXOperator "\v\|"
syntax match textXOperator "\v\!"
syntax match textXOperator "\v\&"
syntax match textXOperator "\v\-"

" Comments
syntax match textXTodo /TODO:/ contained
syntax match textXComment "\v\/\/.*$" contains=textXTodo oneline
syntax region textXComment start="/\*" end="\*/"
      \ contains=textXComment,textXTodo fold


" Highlights
highlight default link textXTodo Todo
highlight default link textXComment Comment
highlight default link textXString String
highlight default link textXRegEx String
highlight default link textXType Type
highlight default link textxRuleName Type
highlight default link textXOperator Operator
highlight default link textXAssignment Operator
highlight default link textXKeyword Keyword
highlight default link textXVariable Identifier
highlight default link textXParams Keyword


let b:current_syntax = "textx"
