local map = vim.keymap.set

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", "\"_dP")

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })


-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

-- Copy diagnostic(s) under cursor to system clipboard
map("n", "<leader>yd", function()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(0, { lnum = lnum })
  if vim.tbl_isempty(diags) then
    vim.notify("No diagnostic on line", vim.log.levels.WARN)
    return
  end
  local msgs = {}
  for _, d in ipairs(diags) do
    table.insert(msgs, d.message)
  end
  local text = table.concat(msgs, "\n")
  vim.fn.setreg("+", text)
  vim.notify("Diagnostic copied: " .. text)
end, { desc = "Yank line diagnostics to clipboard" })
