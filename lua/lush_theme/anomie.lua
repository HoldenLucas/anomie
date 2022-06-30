-- OKHSL color picker
-- https://bottosson.github.io/misc/colorpicker/

local lush = require "lush"
local hsluv = lush.hsluv

-- local eigengrau = hsluv(266, 10, 7)

local white = hsluv(0, 0, 97)
local black = hsluv(0, 0, 20)

local red = hsluv(15, 100, 60)
local green = hsluv(110, 100, 60)
local blue = hsluv(240, 100, 60)
local yellow = hsluv(70, 100, 83)
local light_yellow = hsluv(74, 100, 92)

-- INSPIRATION

-- https://github.com/mcchrish/zenbones.nvim/blob/8a36b0494d8d41ab9defbd1cff81378c3238a696/lua/zenbones/specs/light.lua
-- also see `zenwritten`
--
-- https://github.com/kkga/vim-envy
-- https://github.com/karoliskoncevicius/distilled-vim
-- https://git.sr.ht/~romainl/vim-bruin
-- https://github.com/stefanvanburen/rams

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    ---------------------------------------------------------------------
    -- Default highlight groups (:h highlight-groups)
    ---------------------------------------------------------------------

    Normal { bg = white, fg = black }, -- normal text

    Underlined { gui = "underline", sp = Normal.fg },
    Bold { gui = "bold" },
    Italic { gui = "italic" },

    Todo { fg = black, gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    Error { fg = red }, -- (preferred) any erroneous construct
    ErrorMsg { Error }, -- error messages on the command line
    WarningMsg { fg = yellow }, -- warning messages

    Comment { fg = Normal.fg.lighten(75) }, -- any comment
    Conceal { gui = "bold" }, -- placeholder characters substituted for concealed text (see 'conceallevel')

    Cursor { bg = Normal.fg, fg = Normal.bg.lighten(25) }, -- character under the cursor
    lCursor { Cursor, bg = Cursor.bg.lighten(20) }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    TermCursor { Cursor }, -- cursor in a focused terminal
    TermCursorNC { lCursor }, -- cursor in an unfocused terminal

    CursorLine { bg = Normal.bg.darken(3) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    ColorColumn { CursorLine }, -- used for the columns set with 'colorcolumn'

    Visual { bg = Normal.bg.darken(10) }, -- Visual mode selection

    DiffAdd { bg = green.desaturate(40).lighten(80) }, -- diff mode: Added line |diff.txt|
    DiffChange { bg = blue.desaturate(40).lighten(80) }, -- diff mode: Changed line |diff.txt|
    DiffDelete { bg = red.desaturate(40).lighten(70) }, -- diff mode: Deleted line |diff.txt|
    DiffText { bg = blue.desaturate(18).lighten(56) }, -- diff mode: Changed text within a changed line |diff.txt|

    LineNr { fg = Comment.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    SignColumn { LineNr }, -- column where |signs| are displayed
    FoldColumn { LineNr, gui = "bold" }, -- 'foldcolumn'
    Folded { bg = Normal.bg.darken(16) }, -- line used for closed folds
    CursorLineNr { LineNr, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    MoreMsg {}, -- |more-prompt|

    NormalFloat { Normal, bg = CursorLine.bg }, -- Normal text in floating windows.
    FloatBorder { NormalFloat }, -- Border text in floating windows.

    Pmenu { bg = Normal.bg.darken(10) }, -- Popup menu: normal item.
    PmenuSel { bg = Normal.bg.darken(20) }, -- Popup menu: selected item.
    PmenuSbar { bg = Normal.bg.darken(30) }, -- Popup menu: scrollbar.
    PmenuThumb { bg = Pmenu.bg.lighten(50) }, -- Popup menu: Thumb of the scrollbar.

    Search { bg = light_yellow }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch { bg = yellow, gui = "bold" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

    MatchParen { gui = "reverse" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    StatusLine { bg = Normal.bg.darken(5) }, -- status line of current window
    StatusLineNC { bg = StatusLine.bg.darken(5) }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine         { StatusLine, gui = "italic" }, -- tab pages line, not active tab page label
    -- TabLineFill     { StatusLineNC }, -- tab pages line, where there are no labels
    -- TabLineSel      { gui = "bold" }, -- tab pages line, active tab page label

    NonText { fg = Normal.fg.lighten(50) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    SpecialKey { NonText }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    Whitespace { NonText }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    EndOfBuffer { NonText }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.

    WildMenu {}, -- current match in 'wildmenu' completion
    Directory { gui = "bold" }, -- directory names (and other special names in listings)
    Question { MoreMsg }, -- |hit-enter| prompt and yes/no questions
    Title { gui = "bold" }, -- titles for output from ":set all", ":autocmd" etc.

    ---------------------------------------------------------------------
    -- De-Facto highlight groups (:h group-name)
    --
    -- NOTE: Commented out groups should chain up to their "preferred" group
    ---------------------------------------------------------------------

    Constant { fg = Normal.fg.lighten(25) }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier { fg = Normal.fg }, -- (preferred) any variable name
    Function { fg = Normal.fg }, -- function name (also: methods for classes)

    Statement { fg = Normal.fg, gui = "bold" }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc { Statement }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Special { fg = Normal.fg.lighten(25), gui = "bold" }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter { fg = Normal.fg.darken(50) }, --  character that needs attention
    SpecialComment { Comment, gui = "NONE" }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Type { Special }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    -------------------------------------------------------------------------
    -- Tree-Sitter (:h nvim-treesitter-highlights)
    -------------------------------------------------------------------------

    -- TODO highlighting
    TSWarning { Todo },
    -- FIXME highlighting
    TSDanger { Todo, gui = "bold, reverse" },
    -- For text to be represented with emphasis.
    TSEmphasis { Italic },
    -- For text to be represented with an underline.
    TSUnderline { Underlined },
    -- Text to be represented in bold.
    TSStrong { Bold },

    -------------------------------------------------------------------------
    -- LSP (:h diagnostic-highlights)
    -------------------------------------------------------------------------

    DiagnosticError { Error },
    DiagnosticWarn { WarningMsg },
    DiagnosticInfo { fg = blue },
    DiagnosticHint { fg = green },

    -- underline as background highlight
    -- DiagnosticUnderlineError { bg = DiagnosticError.fg.lighten(80) },
    -- DiagnosticUnderlineWarn { bg = DiagnosticWarn.fg.lighten(80) },
    -- DiagnosticUnderlineInfo { bg = DiagnosticInfo.fg.lighten(85) },
    -- DiagnosticUnderlineHint { bg = DiagnosticHint.fg.lighten(90) },
    --
    -- set `sp` to use underline, e.g.
    -- DiagnosticUnderlineError { gui = "underline", sp = DiagnosticError.fg },

    -- DiagnosticSignError { fg = DiagnosticError.fg },
    -- DiagnosticSignWarn { fg = DiagnosticWarn.fg },
    -- DiagnosticSignInfo { fg = DiagnosticInfo.fg },
    -- DiagnosticSignHint { fg = DiagnosticHint.fg },

    DiagnosticFloatingError { gui = "underline", sp = DiagnosticError.fg },
    DiagnosticFloatingWarn { gui = "underline", sp = DiagnosticWarn.fg },
    DiagnosticFloatingInfo { gui = "underline", sp = DiagnosticInfo.fg },
    DiagnosticFloatingHint { gui = "underline", sp = DiagnosticHint.fg },

    -- (:h vim.lsp.buf.signature_help)
    LspSignatureActiveParameter { IncSearch },

    -------------------------------------------------------------------------
    -- Plugins
    -------------------------------------------------------------------------

    -- (:h gitsigns-usage)
    GitSignsAdd { fg = green, bg = DiffAdd.bg.lighten(30) },
    GitSignsAddLn { bg = GitSignsAdd.bg.lighten(50) },

    GitSignsChange { fg = blue, bg = DiffChange.bg },
    GitSignsChangeLn { bg = GitSignsChange.bg.lighten(50) },

    GitSignsDelete { fg = red, bg = DiffDelete.bg },
    GitSignsDeleteLn { bg = GitSignsDelete.bg.lighten(50) },

    -- (:h lightspeed-highlight)
    LightspeedGreyWash { fg = Comment.fg },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
