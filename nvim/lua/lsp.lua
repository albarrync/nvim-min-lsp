local nvim_lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostics symbols for display in the sign column.
-- You can change these to fancy glyphs
local signs = { Error = "x", Warn = "!", Hint = "?", Info = "i" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- If they're not working, try running `gem install solargraph` and `gem install ruby-lsp`
-- ruby-lsp requires ruby version 2.7.3 or higher and nvim 0.10.0
nvim_lsp.ruby_lsp.setup{
  cmd = { "/Users/$YOURUSERNAME/.rbenv/shims/ruby-lsp"},
  capabilities = cmp.default_capabilities(capabilities)
}
nvim_lsp.solargraph.setup{
  cmd = { "/Users/$YOURUSERNAME/.rbenv/shims/solargraph", "stdio"},
  capabilities = cmp.default_capabilities(capabilities)
}
nvim_lsp.standardrb.setup{
  cmd = { "/Users/$YOURUSERNAME/.rbenv/shims/standardrb", "--lsp"},
  capabilities = cmp.default_capabilities(capabilities)
}
