-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Perform autoformat the code",
  group = vim.api.nvim_create_augroup("GoFormat", { clear = false }),
  pattern = "*.go",
  callback = function() --vim.cmd('silent! GoFmt')
    require("go.format").goimport()
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Perform autoformat the code 2",
  group = vim.api.nvim_create_augroup("GoFormat2", { clear = true }),
  pattern = "*.go",
  callback = function()
    -- callback = function() vim.cmd('silent! exec ":GoFmt"')
    require("go.format").goimport()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap
    --     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
    --                opts)
    -- vim.keymap.set('n', '<Leader>sl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<Leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
  group = vim.api.nvim_create_augroup("CustomShebangDetection", {}),
  desc = "Set the filetype based on the shebang header",
  callback = function()
    local line = vim.fn.getline(1)
    local pattern1, pattern2 = "^#!.*/bin/env%s+(%w+)", "^#!.*/bin/(%w+)"
    local interpreter = line:match(pattern1) or line:match(pattern2)
    if interpreter then
      vim.api.nvim_set_option_value("filetype", interpreter, { buf = 0 })
    end
  end,
})
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "OilEnter",
--   callback = vim.schedule_wrap(function(args)
--     local oil = require("oil")
--     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
--       oil.open_preview()
--     end
--   end),
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Perform autoformat the code",
  group = vim.api.nvim_create_augroup("ScalaFormat", { clear = false }),
  pattern = "*.scala",
  callback = function() --vim.cmd('silent! GoFmt')
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Perform autoformat the code 2",
  group = vim.api.nvim_create_augroup("ScalaFormat", { clear = false }),
  pattern = "*.scala",
  callback = function() --vim.cmd('silent! GoFmt')
    vim.lsp.buf.format()
  end,
})

-- Show errors and warnings in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float({
      focusable = false,
      source = "if_many",
      scope = "cursor",
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "BufHidden",
        "InsertCharPre",
        "WinLeave",
      },
    })
  end,
})
