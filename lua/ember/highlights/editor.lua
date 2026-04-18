local M = {}

M.get = function(theme)
  local ui = theme.ui
  local syn = theme.syn
  local diag = theme.diag
  local diff = theme.diff

  return {
    -- Base
    Normal = { fg = ui.fg, bg = ui.bg },
    NormalFloat = { fg = ui.fg, bg = ui.float_bg },
    NormalNC = { fg = ui.fg, bg = ui.bg },

    -- Floats
    FloatBorder = { fg = ui.float_border, bg = ui.float_bg },
    FloatTitle = { fg = syn.coral, bold = true },

    -- Cursor
    Cursor = { bg = ui.cursor },
    CursorLine = { bg = ui.cursorline },
    CursorColumn = { bg = ui.cursorline },
    CursorLineNr = { fg = syn.coral, bold = true },
    ColorColumn = { bg = ui.cursorline },

    -- Line numbers & signs
    LineNr = { fg = ui.base5 },
    SignColumn = { bg = ui.bg },

    -- Selection
    Visual = { bg = ui.visual },
    VisualNOS = { bg = ui.visual },

    -- Search
    Search = { fg = ui.search_fg, bg = ui.search_bg, bold = true },
    IncSearch = { fg = ui.search_fg, bg = ui.search_bg, bold = true },
    CurSearch = { fg = ui.search_fg, bg = ui.search_bg, bold = true },
    Substitute = { fg = ui.bg, bg = syn.coral },

    -- Popup menu
    Pmenu = { fg = ui.pmenu_fg, bg = ui.pmenu_bg },
    PmenuSel = { fg = syn.coral, bg = ui.pmenu_sel, bold = true },
    PmenuSbar = { bg = ui.base3 },
    PmenuThumb = { bg = ui.base5 },

    -- Status line
    StatusLine = { fg = ui.statusline_fg, bg = ui.statusline_bg },
    StatusLineNC = { fg = ui.base5, bg = ui.base1 },

    -- Window separators
    WinSeparator = { fg = ui.border },
    VertSplit = { link = "WinSeparator" },

    -- Tab line
    TabLine = { fg = ui.fg_alt, bg = ui.base1 },
    TabLineFill = { bg = ui.base0 },
    TabLineSel = { fg = syn.coral, bg = ui.bg, bold = true },

    -- Titles
    Title = { fg = syn.coral, bold = true },

    -- Invisible characters
    NonText = { fg = ui.base4 },
    SpecialKey = { fg = ui.base4 },
    Whitespace = { fg = ui.base3 },

    -- Matching brackets
    MatchParen = { fg = syn.coral, bold = true, underline = true },

    -- Folding
    Folded = { fg = ui.base6, bg = ui.base2 },
    FoldColumn = { fg = ui.base4 },

    -- File browser
    Directory = { fg = syn.coral, bold = true },

    -- Messages
    Question = { fg = syn.gold },
    MoreMsg = { fg = syn.gold },
    ErrorMsg = { fg = diag.error, bold = true },
    WarningMsg = { fg = diag.warn, bold = true },

    -- Wild menu
    WildMenu = { fg = syn.coral, bg = ui.base3 },

    -- Spell
    SpellBad = { undercurl = true, sp = diag.error },
    SpellCap = { undercurl = true, sp = diag.warn },
    SpellRare = { undercurl = true, sp = diag.info },
    SpellLocal = { undercurl = true, sp = diag.hint },

    -- Diff
    DiffAdd = { bg = diff.add_bg },
    DiffChange = { bg = diff.change_bg },
    DiffDelete = { bg = diff.delete_bg },
    DiffText = { fg = diff.change, bg = diff.text_bg, bold = true },

    -- Window bar
    WinBar = { fg = ui.fg, bold = true },
    WinBarNC = { fg = ui.fg_alt },

    -- Message area
    MsgArea = { fg = ui.fg },
    MsgSeparator = { fg = ui.border },
  }
end

return M
