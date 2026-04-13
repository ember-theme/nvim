<p align="center">
  <img src="assets/logo.svg" alt="Ember" width="80" />
</p>

<h1 align="center">Ember for Neovim</h1>

<p align="center">
  A warm, nearly monochrome Neovim theme.<br/>
  Muted tones, deliberate restraint, and one coral accent that cuts through everything.
</p>

<p align="center">
  <a href="https://embertheme.com">embertheme.com</a> ·
  <a href="https://github.com/ember-theme/ember">Palette</a> ·
  <a href="#installation">Installation</a> ·
  <a href="#variants">Variants</a> ·
  <a href="#plugin-support">Plugin Support</a>
</p>

---

<p align="center">
  <img src="assets/preview.png" alt="Ember variants" width="90%" />
</p>

<p align="center">
  <img src="assets/widgets.png" alt="Ember editor widgets" width="800" />
</p>

## Screenshots

<table>
<tr>
<td align="center"><b>Ember</b><br><sub>dark graphite</sub></td>
<td align="center"><b>Ember Soft</b><br><sub>lifted graphite</sub></td>
<td align="center"><b>Ember Light</b><br><sub>warm ivory</sub></td>
</tr>
<tr>
<td><img src="assets/ember.png" alt="Ember Dark" width="300" /></td>
<td><img src="assets/ember-soft.png" alt="Ember Soft" width="300" /></td>
<td><img src="assets/ember-light.png" alt="Ember Light" width="300" /></td>
</tr>
<tr>
<td><img src="assets/picker-ember.png" alt="Ember Picker" width="300" /></td>
<td><img src="assets/picker-ember-soft.png" alt="Ember Soft Picker" width="300" /></td>
<td><img src="assets/picker-ember-light.png" alt="Ember Light Picker" width="300" /></td>
</tr>
</table>

## Variants

<table width="100%">
<tr><th>Variant</th><th>Background</th><th>Description</th></tr>
<tr><td><code>ember</code></td><td><img src="https://img.shields.io/badge/%20-1c1b19?style=flat-square&color=1c1b19" /> <code>#1c1b19</code></td><td>Dark graphite, L10% — the default</td></tr>
<tr><td><code>ember-soft</code></td><td><img src="https://img.shields.io/badge/%20-242320?style=flat-square&color=242320" /> <code>#242320</code></td><td>Lifted graphite, L13% — softer contrast</td></tr>
<tr><td><code>ember-light</code></td><td><img src="https://img.shields.io/badge/%20-e6dac4?style=flat-square&color=e6dac4" /> <code>#e6dac4</code></td><td>Warm ivory, L84% — darkened accents for WCAG AA</td></tr>
</table>

## Installation

### lazy.nvim

```lua
{
  "ember-theme/nvim",
  name = "ember",
  priority = 1000,
  config = function()
    require("ember").setup({
      variant = "ember", -- "ember" | "ember-soft" | "ember-light"
    })
    vim.cmd("colorscheme ember")
  end,
}
```

### vim.pack

```lua
vim.pack.add({ "https://github.com/ember-theme/nvim" })
vim.cmd.colorscheme("ember")
```

## Configuration

```lua
require("ember").setup({
  variant = "ember", -- "ember", "ember-soft", "ember-light"
  styles = {
    comments  = { italic = true },
    keywords  = { bold = true },
    functions = {},
    types     = { bold = true },
  },
  transparent        = false, -- transparent editor background
  transparent_floats = nil,   -- follows `transparent` by default; set explicitly to override
  on_colors     = nil, -- function(palette) - modify palette before theme builds
  on_highlights = nil, -- function(highlights, theme) - modify highlight groups
})
```

Switch variants at runtime:

```
:colorscheme ember
:colorscheme ember-soft
:colorscheme ember-light
```

## Plugin Support

Built-in highlight coverage for:

<table width="100%">
<tr><th>Category</th><th>Plugins</th></tr>
<tr><td>Syntax</td><td>Treesitter (<code>@capture</code> groups), LSP semantic tokens, diagnostics</td></tr>
<tr><td>Picker</td><td>Telescope, Snacks picker</td></tr>
<tr><td>Completion</td><td>nvim-cmp, blink.cmp</td></tr>
<tr><td>UI</td><td>Which-key, Snacks dashboard, Snacks notifier</td></tr>
<tr><td>File tree</td><td>Neo-tree, Snacks explorer</td></tr>
<tr><td>Git</td><td>Gitsigns</td></tr>
<tr><td>Indent</td><td>indent-blankline, Snacks indent</td></tr>
<tr><td>Statusline</td><td>mini.statusline, mini.tabline, Lualine</td></tr>
<tr><td>Other</td><td>Noice, Lazy.nvim, mini.jump, mini.pick</td></tr>
</table>

## Links

- [Ember core](https://github.com/ember-theme/ember) — palette, brand, ports
- [Emacs port](https://github.com/ember-theme/emacs) — reference implementation
- [Website](https://embertheme.com)

## License

MIT — Hossam Saraya
