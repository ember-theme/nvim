local M = {}

M.config = {
  variant = "ember", -- "ember", "ember-soft", "ember-light"
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    types = { bold = true },
  },
  on_colors = nil, -- function(palette) end — modify palette before theme
  on_highlights = nil, -- function(highlights, theme) end — modify highlights
  transparent = false,
  transparent_floats = nil,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load(variant)
  variant = variant or M.config.variant

  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.o.background = (variant == "ember-light") and "light" or "dark"
  vim.g.colors_name = variant

  -- Build palette
  local palette = require("ember.palette").get(variant)

  -- User palette overrides
  if M.config.on_colors then
    M.config.on_colors(palette)
  end

  -- Build semantic theme
  local theme = require("ember.theme").setup(palette, M.config)

  -- Collect all highlight groups
  local highlights = require("ember.highlights").get(theme)

  -- User highlight overrides
  if M.config.on_highlights then
    M.config.on_highlights(highlights, theme)
  end

  -- Apply all highlights
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- Set terminal colors
  if theme.term then
    for i = 0, 15 do
      vim.g["terminal_color_" .. i] = theme.term[i]
    end
  end
end

return M
