-- Indent_blankline
local status_ok, ibl = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#BF616A gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#D08770 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#EBCB8B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#A3BE8C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#B48EAD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#88C0D0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#5E81AC gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent8 guifg=#81A1C1 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

ibl.setup {
  char = "▏",
  space_char_blankline = " ",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  show_current_context_start = true,
  buftype_exclude = { "terminal", "nofile" },
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
    "IndentBlanklineIndent8",
  },
  filetype_exclude = {
	  "help",
	  "startify",
	  "dashboard",
	  "packer",
	  "neogitstatus",
	  "NvimTree",
	  "Trouble",
    "alpha",
  },
}
