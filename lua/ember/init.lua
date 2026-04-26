local M = {}

---@alias Ember.Variant "ember" | "ember-soft" | "ember-light" | "ember-auto"
---@alias Ember.ConcreteVariant "ember" | "ember-soft" | "ember-light"

---@class Ember.Config
---@field variant Ember.Variant
---@field styles table
---@field on_colors? fun(palette: table)
---@field on_highlights? fun(highlights: table, theme: table)
---@field transparent boolean
---@field transparent_floats? boolean
---@field dark_variant Ember.ConcreteVariant
---@field light_variant Ember.ConcreteVariant

---@class Ember.Options
---@field variant? Ember.Variant
---@field styles? table
---@field on_colors? fun(palette: table)
---@field on_highlights? fun(highlights: table, theme: table)
---@field transparent? boolean
---@field transparent_floats? boolean
---@field dark_variant? Ember.ConcreteVariant
---@field light_variant? Ember.ConcreteVariant

---@type Ember.Config
M.config = {
  variant = "ember",
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    types = { bold = true },
  },
  on_colors = nil,
  on_highlights = nil,
  transparent = false,
  transparent_floats = nil,
  dark_variant = "ember",
  light_variant = "ember-light",
}

local AUTO_VARIANT = "ember-auto"

local VALID_CONCRETE = {}
for _, name in ipairs(require("ember.palette").variants) do
  VALID_CONCRETE[name] = true
end
local VALID_VARIANTS = vim.tbl_extend("force", {}, VALID_CONCRETE, { [AUTO_VARIANT] = true })

local function validate(key, value, allowed, default)
  if allowed[value] then
    return value
  end
  vim.notify(
    string.format(
      "ember: invalid %s = %q (allowed: %s). Falling back to %q.",
      key,
      tostring(value),
      table.concat(vim.tbl_keys(allowed), ", "),
      default
    ),
    vim.log.levels.ERROR
  )
  return default
end

---@param opts? Ember.Options
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  M.config.variant = validate("variant", M.config.variant, VALID_VARIANTS, "ember")
  M.config.dark_variant = validate("dark_variant", M.config.dark_variant, VALID_CONCRETE, "ember")
  M.config.light_variant = validate("light_variant", M.config.light_variant, VALID_CONCRETE, "ember-light")
end

---@param variant? Ember.Variant
function M.load(variant)
  variant = validate("variant", variant or M.config.variant, VALID_VARIANTS, "ember")

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
