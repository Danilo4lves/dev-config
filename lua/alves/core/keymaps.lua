vim.g.mapleader = " "

local keymap = vim.keymap

-- Windows
keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>ws", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>wk", ":TmuxNavigateUp<CR>") -- move to upper window
keymap.set("n", "<leader>wl", ":TmuxNavigateRight<CR>") -- move to right window
keymap.set("n", "<leader>wh", ":TmuxNavigateLeft<CR>") -- move to left window
keymap.set("n", "<leader>wj", ":TmuxNavigateDown<CR>") -- move to bottom window
keymap.set("n", "<leader>wd", ":close<CR>") -- close current split window
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>") -- maximizes or restore current window

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
