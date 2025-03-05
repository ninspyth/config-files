-- -- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
--
local lspconfig = require "lspconfig"
--
-- -- EXAMPLE
local servers = { "html", "cssls", "clangd", "gopls", "pylyzer"}
local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
--
-- local on_attach = function(client, bufnr)
--   -- format on save 
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = vim.api.nvim_create_augroup("Format", { clear = true }),
--       buffer = bufnr,
--       callback = function() vim.lsp.buf.formatting_seq_sync() end
--     })
--   end
-- end
--
-- -- TypeScript 
-- nvlsp.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" }
-- }
--
-- custom lsp configs
local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then return end

-- local on_attach = function(client, bufnr)
--   -- format on save 
--     if client.server_capabilities.documentFormattingProvider then
--         vim.api.nvim_create_autocmd("BufWritePre", {
--         group = vim.api.nvim_create_augroup("Format", { clear = true }),
--         buffer = bufnr,
--         callback = function() vim.lsp.buf.formatting_seq_sync() end
--         })
--     end
-- end
--
-- TypeScript 
nvim_lsp.ts_ls.setup {
    on_attach = nvlsp.on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact"},
    cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.rust_analyzer.setup {
    filetypes = {"rust"},
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}

nvim_lsp.html.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = {"html", "js"}
}
