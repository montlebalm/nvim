return {
  'ThePrimeagen/harpoon',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local harpoon = require('harpoon')

    harpoon.setup()

    vim.keymap.set("n", "<leader>h", function()
      require("harpoon.ui").toggle_quick_menu()
    end)

    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon.mark").add_file()
    end)

    vim.keymap.set("n", "<leader>hn", function()
      require("harpoon.mark").nav_next()
    end)

    vim.keymap.set("n", "<leader>hp", function()
      require("harpoon.mark").nav_prev()
    end)

    -- vim.keymap.set("n", "<leader>hd", function()
    -- 	harpoon.list().remove()
    -- end, opts)
  end
}
