

local dap = require('dap')
dap.adapters.cpp = {
    type = 'executable',
    command = '/opt/homebrew/Cellar/llvm@16/16.0.6/bin/lldb-vscode', -- my binary was called 'lldb-vscode-11'
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "lldb",
        type = "cpp",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        externalTerminal = true,
        stopOnEntry = true,
    },
}
