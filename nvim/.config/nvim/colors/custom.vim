highlight clear

if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "custom"

" ======================
" palette (muted)
" ======================
let s:black   = ["#1c1c1c", "234"]
let s:white   = ["#d0d0d0", "252"]

let s:bg_alt  = ["#242424", "235"]
let s:bg_ui   = ["#303030", "236"]
let s:bg_diff = ["#383838", "237"]

let s:blue    = ["#8eb1d4", "110"]
let s:green   = ["#87d75f", "113"]
let s:red     = ["#ff5f5f", "203"]
let s:yellow  = ["#e4c27a", "180"]
let s:cyan    = ["#8fbf9f", "108"]
let s:brown   = ["#af875f", "137"]
let s:comment = ["#7c7c7c", "243"]

let s:bold      = "bold"
let s:italic    = "italic"
let s:underline = "underline"

" ======================
" highlight helper
" ======================
function! s:hl(group, attrs) abort
  if has_key(a:attrs, "fg")
    let a:attrs["guifg"] = a:attrs["fg"][0]
    let a:attrs["ctermfg"] = a:attrs["fg"][1]
    unlet a:attrs["fg"]
  endif

  if has_key(a:attrs, "bg")
    let a:attrs["guibg"] = a:attrs["bg"][0]
    let a:attrs["ctermbg"] = a:attrs["bg"][1]
    unlet a:attrs["bg"]
  endif

  if has_key(a:attrs, "style")
    let a:attrs["gui"] = a:attrs["style"]
    let a:attrs["cterm"] = a:attrs["style"]
    unlet a:attrs["style"]
  endif

  let l:defaults = {
        \ "guifg": "NONE", "guibg": "NONE", "gui": "NONE", "guisp": "NONE",
        \ "ctermfg": "NONE", "ctermbg": "NONE", "cterm": "NONE"
        \ }

  call extend(l:defaults, a:attrs)

  let l:cmd = "highlight " . a:group
  for k in keys(l:defaults)
    let l:cmd .= " " . k . "=" . l:defaults[k]
  endfor

  execute l:cmd
endfunction

" ======================
" UI
" ======================
call s:hl("Normal",        { "fg": s:white, "bg": s:black })
call s:hl("CursorLine",    { "bg": s:bg_ui })
call s:hl("ColorColumn",   { "bg": s:bg_ui })
" float / hover popup
call s:hl("NormalFloat", { "fg": s:white, "bg": s:bg_ui })

call s:hl("LineNr",        { "fg": s:comment })
call s:hl("CursorLineNr",  { "fg": s:yellow })

call s:hl("WinSeparator", { "fg": s:bg_ui })
call s:hl("EndOfBuffer",   { "fg": s:black })

call s:hl("StatusLine",    { "fg": s:white, "bg": s:bg_ui, "style": s:bold })
call s:hl("StatusLineNC",  { "fg": s:comment, "bg": s:bg_ui })

call s:hl("Pmenu",         { "fg": s:white, "bg": s:bg_ui })
call s:hl("PmenuSel",      { "fg": s:black, "bg": s:yellow })
call s:hl("PmenuSbar",     { "bg": s:bg_ui })
call s:hl("PmenuThumb",    { "bg": s:bg_alt })

call s:hl("Visual",        { "bg": s:bg_diff })
call s:hl("MatchParen",    { "bg": s:bg_ui })

call s:hl("FoldColumn",     { "fg": s:comment, "bg": s:black })
call s:hl("Folded",         { "fg": s:comment, "bg": s:bg_alt })

call s:hl("Search",    { "fg": s:black, "bg": s:yellow })
call s:hl("IncSearch", { "fg": s:black, "bg": s:brown })
call s:hl("CurSearch", { "fg": s:black, "bg": s:yellow })

" ======================
" syntax
" ======================
call s:hl("Comment",       { "fg": s:comment })

call s:hl("Constant",      { "fg": s:cyan })
call s:hl("String",        { "fg": s:green })
call s:hl("Identifier",    { "fg": s:white })
call s:hl("Function",      { "fg": s:blue })

call s:hl("Statement",     { "fg": s:white })
call s:hl("Type",          { "fg": s:yellow, "style": s:bold })
call s:hl("PreProc",       { "fg": s:cyan })

" slightly tinted so it doesn't vanish into Identifier
call s:hl("Special",       { "fg": s:cyan })
call s:hl("Underlined",    { "style": s:underline })

call s:hl("Todo",          { "fg": s:brown, "style": s:italic })

" ======================
" diff (background-based)
" ======================
call s:hl("DiffAdd",       { "bg": ["#203020", "22"] })
call s:hl("DiffDelete",    { "bg": ["#302020", "52"] })
call s:hl("DiffChange",    { "bg": ["#202830", "17"] })
" slightly lighter than bg_ui so changed text stands out within a changed line
call s:hl("DiffText",      { "bg": s:bg_diff })

call s:hl("diffAdded",     { "fg": s:green })
call s:hl("diffRemoved",   { "fg": s:red })

" ======================
" spell
" ======================
call s:hl("SpellBad",      { "style": s:underline })
call s:hl("SpellCap",      { "style": s:underline })
call s:hl("SpellLocal",    { "style": s:underline })
call s:hl("SpellRare",     { "style": s:underline })

" ======================
" treesitter
" ======================
call s:hl("@comment",      { "fg": s:comment })

call s:hl("@string",       { "fg": s:green })
call s:hl("@constant",     { "fg": s:cyan })

call s:hl("@function",     { "fg": s:blue })
call s:hl("@function.method", { "fg": s:blue })

call s:hl("@keyword",      { "fg": s:white })
call s:hl("@conditional",  { "fg": s:white })
call s:hl("@repeat",       { "fg": s:white })

call s:hl("@type",         { "fg": s:yellow })
call s:hl("@type.builtin", { "fg": s:yellow })
call s:hl("@type.definition", { "fg": s:yellow })

call s:hl("@variable",     { "fg": s:white })

call s:hl("TreesitterContext",           { "bg": s:bg_ui })
call s:hl("TreesitterContextLineNumber", { "fg": s:brown, "bg": s:bg_ui })
call s:hl("TreesitterContextSeparator",  { "fg": s:yellow })

" neotree
call s:hl("NeoTreeDirectoryIcon", { "fg": s:blue })
call s:hl("NeoTreeDirectoryName", { "fg": s:blue })
call s:hl("NeoTreeRootName",      { "fg": s:blue, "style": s:bold })

" telescope
call s:hl("TelescopeMatching", { "fg": s:brown, "style": s:bold })
call s:hl("TelescopeSelection", { "fg": s:white, "bg": s:bg_ui })

" messages, diagnostics & errors
call s:hl("DiagnosticError", { "fg": s:red })
call s:hl("DiagnosticWarn",  { "fg": s:yellow })
call s:hl("DiagnosticInfo",  { "fg": s:blue })
call s:hl("DiagnosticHint",  { "fg": s:comment })
call s:hl("Error",         { "fg": s:red })
call s:hl("ErrorMsg",      { "fg": s:red })
call s:hl("WarningMsg",    { "fg": s:yellow })
call s:hl("MoreMsg",       { "fg": s:green })
call s:hl("Question",      { "fg": s:blue })

" gitsigns
call s:hl("GitSignsAdd",    { "fg": s:green })
call s:hl("GitSignsChange", { "fg": s:yellow })
call s:hl("GitSignsDelete", { "fg": s:red })

" mini.statusline
call s:hl("MiniStatuslineFilename", { "fg": s:white, "bg": s:bg_ui })
call s:hl("MiniStatuslineModeNormal",  { "fg": s:black, "bg": s:yellow, "style": s:bold })
call s:hl("MiniStatuslineModeInsert",  { "fg": s:black, "bg": s:green,  "style": s:bold })
call s:hl("MiniStatuslineModeVisual",  { "fg": s:black, "bg": s:cyan,   "style": s:bold })
call s:hl("MiniStatuslineModeReplace", { "fg": s:black, "bg": s:red,    "style": s:bold })
call s:hl("MiniStatuslineModeCommand", { "fg": s:black, "bg": s:brown,  "style": s:bold })
call s:hl("MiniStatuslineInactive",    { "fg": s:comment, "bg": s:bg_ui })

" ======================
" LSP reference highlights
" ======================
call s:hl("LspReferenceText",  { "bg": ["#4a4a4a", "239"] })
call s:hl("LspReferenceRead",  { "bg": ["#4a4a4a", "239"] })
call s:hl("LspReferenceWrite", { "bg": ["#4a4a4a", "239"] })
