-- Markdown specific settings
vim.opt.wrap = true -- Wrap text
vim.opt.breakindent = true -- Match indent on line break
vim.opt.linebreak = true -- Line break on whole words
vim.opt.shiftwidth = 8 -- tamaño de la identacion por defecto
vim.opt.tabstop = 4 --numero de espacios que represent la identacion
vim.opt.numberwidth = 2 -- set width of line number column
-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

--General behaviors
vim.opt.mouse = "a" --enable mouse support
