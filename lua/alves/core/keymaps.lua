vim.g.mapleader = " "

local keymap = vim.keymap

-- Windows management
keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>ws", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>wk", ":TmuxNavigateUp<CR>") -- move to upper window
keymap.set("n", "<leader>wl", ":TmuxNavigateRight<CR>") -- move to right window
keymap.set("n", "<leader>wh", ":TmuxNavigateLeft<CR>") -- move to left window
keymap.set("n", "<leader>wj", ":TmuxNavigateDown<CR>") -- move to bottom window
keymap.set("n", "<leader>wd", ":close<CR>") -- close current split window
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>") -- maximizes or restore current window

-- Tabs management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>td", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- File explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- maximizes or restore current window

-- File finding
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Git
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- Code navigation
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Code diagnostic
keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Code formatting
keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- Code fix
keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", { silent = true, nowait = true })
keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true, nowait = true })

-- Code completion
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { silent = true, noremap = true, expr = true, replace_keycodes = false })
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { silent = true, noremap = true, expr = true, replace_keycodes = false })
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, noremap = true, expr = true, replace_keycodes = false }) -- <C-g>u breaks current undo, please make your own choice.
keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true, nowait = true })
keymap.set("i", "<C-k>", 'coc#pum#prev(1)', { silent = true, expr = true })
keymap.set("i", "<C-j>", 'coc#pum#next(1)', { silent = true, expr = true })

-- Coc misc
keymap.set("n", "<space>cd", ":<C-u>CocList diagnostics<cr>", { silent = true, nowait = true }) -- Show all diagnostics.
keymap.set("n", "<space>ce", ":<C-u>CocList extensions<cr>", { silent = true, nowait = true }) -- Manage extensions.
keymap.set("n", "<space>cc", ":<C-u>CocList commands<cr>", { silent = true, nowait = true }) -- Show commands.
keymap.set("n", "<space>co", ":<C-u>CocList outline<cr>", { silent = true, nowait = true }) -- Find symbol of current document.
keymap.set("n", "<space>cs", ":<C-u>CocList -I symbols<cr>", { silent = true, nowait = true }) -- Search workspace symbols.
keymap.set("n", "<space>cn", ":<C-u>CocNext<cr>", { silent = true, nowait = true }) -- Do default action for next item.
keymap.set("n", "<space>cp", ":<C-u>CocPrev<cr>", { silent = true, nowait = true }) -- Do default action for previous item.
keymap.set("n", "<space>cr", ":<C-u>CocListResume<cr>", { silent = true, nowait = true }) -- Resume latest coc list.
