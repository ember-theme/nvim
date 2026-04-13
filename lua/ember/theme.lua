-- ember/theme.lua
-- Semantic mapping layer — translates a raw palette into a structured theme
-- table that highlight-group modules can consume directly.

local util = require("ember.util")

local M = {}

--- Build the semantic theme table from a palette (as returned by palette.get()).
---@param p table  flat palette with bg, fg, accents, and ramp
---@return table   structured theme with ui, syn, diag, diff, term sections
function M.setup(p)
  return {
    --------------------------------------------------------------------------
    -- UI chrome
    --------------------------------------------------------------------------
    ui = {
      fg           = p.fg,
      fg_alt       = p.fg_alt,
      bg           = p.bg,
      bg_alt       = p.bg_alt,

      -- Full ramp exposed for one-off use
      base0        = p.base0,
      base1        = p.base1,
      base2        = p.base2,
      base3        = p.base3,
      base4        = p.base4,
      base5        = p.base5,
      base6        = p.base6,
      base7        = p.base7,
      base8        = p.base8,

      cursor       = p.coral,
      selection     = p.base4,
      highlight    = p.base4,
      border       = p.base4,

      float_bg     = p.base0,       -- darker than editor for visual separation
      float_border = p.base3,

      pmenu_bg     = p.base2,
      pmenu_sel    = p.base4,
      pmenu_fg     = p.fg,

      statusline_bg = p.base1,
      statusline_fg = p.fg_alt,

      search_bg    = p.coral,
      search_fg    = p.bg,

      visual       = p.base4,
      cursorline   = p.bg_alt,    -- Emacs: hl-line = #242320 = bg-alt
    },

    --------------------------------------------------------------------------
    -- Syntax
    --------------------------------------------------------------------------
    syn = {
      keyword          = p.coral,      -- hero accent
      func             = p.gold,
      string           = p.olive,
      type             = p.gold,       -- shares with func
      constant         = p.orange,
      number           = p.orange,
      method           = p.sage,
      property         = p.fg_alt,     -- Emacs: most property refs are just fg/fg-alt
      comment          = p.base6,      -- Emacs: base6
      doc_comment      = p.base7,      -- Emacs: base7
      operator         = p.base7,      -- Emacs: base7
      preproc          = p.coral,      -- Emacs: red (coral)
      builtin          = p.coral,      -- Emacs: red (coral) — builtins match keywords
      variable         = p.fg,         -- Emacs: fg
      variable_use     = p.fg_alt,     -- Emacs: fg-alt for variable uses
      variable_builtin = p.coral,

      -- Raw accent aliases for direct use in highlight groups
      coral  = p.coral,
      orange = p.orange,
      gold   = p.gold,
      olive  = p.olive,
      sage   = p.sage,
      steel  = p.steel,
      rose   = p.rose,
      mauve  = p.mauve,
    },

    --------------------------------------------------------------------------
    -- Diagnostics
    --------------------------------------------------------------------------
    diag = {
      error    = p.rose,
      warn     = p.gold,
      info     = p.steel,
      hint     = p.sage,

      -- Subtle tinted backgrounds for virtual-text lines / signs
      error_bg = util.blend(p.rose,  p.bg, 0.1),
      warn_bg  = util.blend(p.gold,  p.bg, 0.1),
      info_bg  = util.blend(p.steel, p.bg, 0.1),
      hint_bg  = util.blend(p.sage,  p.bg, 0.1),
    },

    --------------------------------------------------------------------------
    -- Diff
    --------------------------------------------------------------------------
    diff = {
      add    = p.olive,
      change = p.gold,       -- Emacs: vc-modified = yellow (gold)
      delete = p.coral,      -- Emacs: vc-deleted = red (coral)

      -- Subtle tinted backgrounds for diff regions
      add_bg    = util.blend(p.olive, p.bg, 0.15),
      change_bg = util.blend(p.gold,  p.bg, 0.15),
      delete_bg = util.blend(p.rose,  p.bg, 0.15),
      -- Stronger background for the exact changed text within a changed line
      text_bg   = util.blend(p.gold,  p.bg, 0.30),
    },

    --------------------------------------------------------------------------
    -- Terminal (ANSI 0-15)
    --------------------------------------------------------------------------
    term = {
      [0]  = p.base1,   -- black
      [1]  = p.rose,    -- red
      [2]  = p.olive,   -- green
      [3]  = p.gold,    -- yellow
      [4]  = p.steel,   -- blue
      [5]  = p.mauve,   -- magenta
      [6]  = p.sage,    -- cyan
      [7]  = p.fg,      -- white

      -- Bright variants (8-15)
      [8]  = p.base4,   -- bright black
      [9]  = p.rose,    -- bright red
      [10] = p.olive,   -- bright green
      [11] = p.gold,    -- bright yellow
      [12] = p.steel,   -- bright blue
      [13] = p.mauve,   -- bright magenta
      [14] = p.sage,    -- bright cyan
      [15] = p.fg,      -- bright white
    },
  }
end

return M
