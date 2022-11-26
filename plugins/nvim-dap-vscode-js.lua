local dap, dap_vscode = require "dap", require "dap-vscode-js"

dap_vscode.setup {
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node" },
}

dap.adapters.lldb = {
  type = "executable",
  -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
  command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
  name = "lldb",
}

function mysplit(inputstr, sep)
  if sep == nil then sep = "%s" end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = function() return mysplit(vim.fn.input "Arguments: ", nil) end,
    runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    language == "typescript" and {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "ts-node",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    } or {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end
