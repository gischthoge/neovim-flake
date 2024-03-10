# vim: ft=lua
{ pkgs }:
''
  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()


local lsp = require("lspconfig")

-- NIX 
lsp.nil_ls.setup({
 autostart = true,
 capabilities = capabilities,
  cmd = { "${pkgs.nil}/bin/nil" }
})

-- Python
lsp.pyright.setup({
  capabilities = capabilities,
  on_attach = default_on_attach,
  cmd = { "${pkgs.nodePackages.pyright}/bin/pyright-langserver", "--stdio" },
})

lsp.texlab.setup({
  capabilities = capabilities,
  cmd = { "${pkgs.texlab}/bin/texlab", },
})


-- lua
lsp.lua_ls.setup({
  capabilities = capabilities,
  cmd = { "${pkgs.lua-language-server}/bin/lua-language-server", },
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path.."/.luarc.json") and not vim.loop.fs_stat(path.."/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT"
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
})
''
