-- Загружаем стандартные настройки, т.е. lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Список серверов
local servers = { "html", "cssls", "gopls", "intelephense" }  -- Добавляем "intelephense"
local nvlsp = require "nvchad.configs.lspconfig"

-- LSP с настройками по умолчанию
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Конфигурация отдельного сервера, пример: TypeScript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Конфигурация для Intelephense
lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000; -- Устанавливаем максимальный размер файла
      };
    };
  };
}
