" Vim syntax file
" Language:     DCPU-16 Assembler (Notch's virtual CPU, http://0x10c.com)
" Maintainer:   Matt Sarnoff <msarnoff.org>
" Last Change:  April 5, 2012
" URL:          http://github.com/74hc595/dcpu16-vim-syntax
" Revision:     1


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case match
syn keyword dcpuTodo NOTE TODO FIXME XXX contained
syn case ignore

" any valid identifier
syn match dcpuIdentifier "[a-z_][a-z0-9_]*"

" valid label
syn match dcpuLabel      "^:[A-Z_][A-Z0-9_]*"
syn match dcpuSubLabel   "^:\.[A-Z_][A-Z0-9_]*"
" me=e-1

" one character
syn match dcpuASCII      "'.'"

" numbers:
" octal
syn match dcpuNumber     "\<0[0-7]*\>"
syn match dcpuNumber     "\<[0-7]\+[oO]\>"
" decimal
syn match dcpuNumber     "\<[1-9][0-9]*\>"
" hexadecimal
syn match dcpuNumber     "\<0[Xx][0-9a-fA-F]\+\>"
syn match dcpuNumber     "\<[0-9][0-9a-fA-F]*[Hh]\>"
syn match dcpuNumber     "\$[0-9a-fA-F]\+\>"
" binary
syn match dcpuNumber     "\<0[Bb][01]\+\>"
syn match dcpuNumber     "\<[0-1]\+[bB]\>"

" string in double quotes
syn region dcpuString    start=+"+ end=+"+

" comments with special marks
syn match dcpuComment    ";.*" contains=dcpuTodo
syn region dcpuComment   start="/\*" end="\*/"

" registers
syn keyword dcpuRegister        a b c x y z i j sp pc o pop peek push

" instruction opcodes
syn keyword dcpuOpcode  set add sub mul div mod shl shr and bor xor ife ifn ifg ifb
syn keyword dcpuOpcode  jsr

" directives
syn keyword dcpuDirective       word


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dcpu_syntax_inits")
  if version < 508
    let did_dcpu_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink dcpuTodo               Todo
  HiLink dcpuComment            Comment

  HiLink dcpuLabel              Function
  HiLink dcpuSubLabel           Label
  HiLink dcpuString             String
  HiLink dcpuASCII              Character
  HiLink dcpuNumber             Number

  HiLink dcpuOpcode             Statement
  HiLink dcpuRegister           Type
  HiLink dcpuDirective          PreProc

  delcommand HiLink
endif


let b:current_syntax = "dcpu"

" vim: ts=8 syntax=vim
