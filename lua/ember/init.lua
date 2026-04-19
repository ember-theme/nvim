local M = {}

M.config = {
  variant = "ember", -- "ember", "ember-soft", "ember-light", "ember-auto"
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
  dark_variant = "ember", -- variant used by `ember-auto` when background = "dark"
  light_variant = "ember-light", -- variant used by `ember-auto` when background = "light"
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local AUTO_VARIANT = "ember-auto"

function M.load(variant)
  variant = variant or M.config.variant

  local is_auto = variant == AUTO_VARIANT
  local resolved = variant
  if is_auto then
    resolved = (vim.o.background == "light") and M.config.light_variant or M.config.dark_variant
  end

  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  if not is_auto then
    vim.o.background = (resolved == "ember-light") and "light" or "dark"
  end
  vim.g.colors_name = is_auto and AUTO_VARIANT or resolved

  -- Build palette
  local palette = require("ember.palette").get(resolved)

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
