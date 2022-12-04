local keymap = vim.keymap
local options = vim.opt

-- Some servers have issues with backup files, see #649.
options.backup = false
options.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
options.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
options.signcolumn = "yes"

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.ts,*.js,*.rs",
    command = "call CocAction('format')",
    desc = "Format on save"
})

-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
options.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

vim.g.coc_global_extensions = {
  'coc-sh',
  'coc-clangd',
  'coc-css',
  'coc-flutter',
  'coc-go',
  'coc-html',
  'coc-tsserver',
  'coc-json',
  'coc-markdownlint',
  'coc-pyright',
  'coc-rust-analyzer',
  'coc-prettier'
}
