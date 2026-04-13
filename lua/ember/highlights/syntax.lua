local M = {}

M.get = function(theme)
  local ui = theme.ui
  local syn = theme.syn
  local diag = theme.diag
  local diff = theme.diff

  return {
    -- Comments
    Comment = { fg = syn.comment, italic = true },

    -- Constants — Emacs: orange, semibold
    Constant = { fg = syn.constant, bold = true },
    String = { fg = syn.string },
    Character = { fg = syn.string },
    Number = { fg = syn.number, bold = true },
    Boolean = { fg = syn.constant, bold = true },
    Float = { fg = syn.number, bold = true },

    -- Identifiers — Emacs: variable-use = fg-alt
    Identifier = { fg = syn.variable_use },
    Function = { fg = syn.func },

    -- Statements
    Statement = { fg = syn.keyword, bold = true },
    Conditional = { fg = syn.keyword, bold = true },
    Repeat = { fg = syn.keyword, bold = true },
    Label = { fg = syn.coral },
    Operator = { fg = syn.operator },
    Keyword = { fg = syn.keyword, bold = true },
    Exception = { fg = syn.keyword, bold = true },

    -- Preprocessor
    PreProc = { fg = syn.preproc },
    Include = { fg = syn.preproc },
    Define = { fg = syn.preproc },
    Macro = { fg = syn.preproc },
    PreCondit = { fg = syn.preproc },

    -- Types
    Type = { fg = syn.type, bold = true, italic = true },
    StorageClass = { fg = syn.keyword },
    Structure = { fg = syn.type },
    Typedef = { fg = syn.type },

    -- Special
    Special = { fg = syn.coral },
    SpecialChar = { fg = syn.orange },
    Tag = { fg = syn.coral },
    Delimiter = { fg = ui.fg_alt },
    SpecialComment = { fg = syn.doc_comment, italic = true },
    Debug = { fg = syn.rose },

    -- Text styling
    Underlined = { fg = syn.coral, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },

    -- Diagnostics & tasks
    Error = { fg = diag.error },
    Todo = { fg = syn.coral, bold = true, italic = true },

    -- Diff
    Added = { fg = diff.add },
    Changed = { fg = diff.change },
    Removed = { fg = diff.delete },

    -- diff filetype syntax (*.patch, *.diff, git diff output)
    diffAdded     = { fg = diff.add },
    diffRemoved   = { fg = diff.delete },
    diffChanged   = { fg = diff.change },
    diffOldFile   = { fg = diff.delete, bold = true },
    diffNewFile   = { fg = diff.add, bold = true },
    diffFile      = { fg = syn.coral, bold = true },
    diffLine      = { fg = syn.gold, italic = true },
    diffIndexLine = { fg = syn.steel },
    diffSubname   = { fg = ui.fg_alt, italic = true },
  }
end

return M
