local dap = require('dap')


dap.configurations.python = {
    {
        name = "launch file";
        type = 'python';
        request = 'launch';
        program = function ()
            return "${file}";
        end,
        pythonPath = function ()
            return "/usr/local/bin/python";
        end,
    }
}
dap.adapters.python= {
    type = 'executable';
    command = "/usr/local/bin/python";
    args = { "-m", "debugpy.adapter" };
}
