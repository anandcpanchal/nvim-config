return {
  {
    "nvim-neotest/nvim-nio", -- Make sure this is added
    lazy = true,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
      local dap = require("dap")

      -- Python adapter
      dap.adapters.python = {
        type = "executable",
        command = "/Users/anandpanchal/.pyenv/versions/nvim-python/bin/python", -- Update this to your Python path
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- This will debug the current file
          pythonPath = function()
            return "/Users/anandpanchal/.pyenv/versions/nvim-python/bin/python" -- Update this to your Python path
          end,
        },
      }

      require("dapui").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },
}
