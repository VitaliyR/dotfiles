vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>tc", ":let &scrolloff=999-&scrolloff+" .. Scrolloff .. "<CR>")
vim.keymap.set("n", "<leader>L", ":Lazy<CR>")

vim.keymap.set("n", "<leader>od", ":!open %:p:h<CR>")

-- [[ Basic Keymaps ]]

-- go to previous file
vim.keymap.set("n", "<leader>W", "<C-^>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- move when highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle when search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when appending next line keep the cursor on the same line
vim.keymap.set("n", "J", "mzJ`z")

-- paste over highlighted and keep buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- go window/pane
-- commented out because of using tmux plugin
-- vim.keymap.set('n', '<C-l>', '<C-w>l')
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set("n", "<C-w>|", "<C-w>v")
vim.keymap.set("n", "<C-w>-", "<C-w>s")

-- smart resize which follows natural direction
ResizePane = function(dir, resDir, count)
	local ldir = dir
	if resDir then
		if vim.fn.winnr("l") == vim.fn.winnr() then
			ldir = not ldir
		end
	else
		if vim.fn.winnr("j") == vim.fn.winnr() then
			ldir = not ldir
		end
	end
	vim.cmd((resDir and "vert " or "") .. "resize " .. (ldir and "+" or "-") .. count)
end

vim.keymap.set("n", "<C-w>h", ":lua ResizePane(false, true, vim.v.count1)<CR>")
vim.keymap.set("n", "<C-w>l", ":lua ResizePane(true, true, vim.v.count1)<CR>")
vim.keymap.set("n", "<C-w>k", ":lua ResizePane(false, false, vim.v.count1)<CR>")
vim.keymap.set("n", "<C-w>j", ":lua ResizePane(true, false, vim.v.count1)<CR>")

-- replace word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- buffers
vim.keymap.set("n", "<leader>q", ":bp<CR>")
vim.keymap.set("n", "<leader>w", ":bn<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
