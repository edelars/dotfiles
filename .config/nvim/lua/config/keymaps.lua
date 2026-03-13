vim.g.mapleader = " "
vim.keymap.del("n", "<leader>/")

vim.keymap.set("n", "<leader>/", ":normal gcc<CR><DOWN>", { desc = "[/] Toggle comment line" })
vim.keymap.set("v", "<leader>/", "<Esc>:normal gvgc<CR>", { desc = "[/] Toggle comment block" })
-- vim.keymap.set({ "v", "n", "i" }, "<F6>", function()
--   Snacks.terminal()
-- end, { desc = "Terminal (cwd)" })

--F LINE
vim.keymap.set("n", "<F4>", "<cmd>wa <CR>", { desc = "Save all" })

vim.keymap.set("n", "<leader>v", function()
  require("lazy").home()
end, { desc = "Lazy" })
vim.keymap.set("n", "<leader><Esc>", "<cmd>confirm q<cr>>", { desc = "Quit" })
vim.keymap.set("n", "<leader>N", "<cmd>enew<cr>", { desc = "New file" })
vim.keymap.set("n", "<leader>`", "<cmd>bw<cr>", { desc = "Close" })
