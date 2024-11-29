return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "msfussenegger/nvim-jdtls",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    --gain access to the springboot nvim pluggin and its funtions
    local springboot_nvim = require("springboot-nvim")

    --set a vim motion to <Space> + <Shift> + r to run the spring boot project
    vim.keymap.set('n', '<leader>jz', springboot_nvim.boot_run, { desc = "[R]un [J]ava Springboot" })
    vim.keymap.set('n', '<leader>jcc', springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
    vim.keymap.set('n', '<leader>jci', springboot_nvim.boot_run, { desc = "[J]ava Create [I]nterface" })
    vim.keymap.set('n', '<leader>jce', springboot_nvim.boot_run, { desc = "[J]ava Create [Enum]" })

    springboot_nvim.setup({})

  end
}
