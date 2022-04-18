return {
  setup = function()
    local unmap = vim.keymap.del
    local map = vim.keymap.set

    unmap("n", "<A-j>")
    unmap("n", "<A-k>")
    unmap("n", "<C-Down>")
    unmap("n", "<C-Left>")
    unmap("n", "<C-Right>")
    unmap("n", "<C-Up>")
    unmap("n", "<C-\\>")
    unmap("n", "<C-q>")
    unmap("n", "<C-s>")
    unmap("v", "<A-j>")
    unmap("v", "<A-k>")
    unmap("v", "<")
    unmap("v", ">")
    unmap("v", "J")
    unmap("v", "K")

    -- resize with arrows
    map("n", "<Up>", function()
      require("smart-splits").resize_up(2)
    end)
    map("n", "<Down>", function()
      require("smart-splits").resize_down(2)
    end)
    map("n", "<Left>", function()
      require("smart-splits").resize_left(2)
    end)
    map("n", "<Right>", function()
      require("smart-splits").resize_right(2)
    end)
    -- navigating wrapped lines
    map({ "n", "v" }, "j", "gj")
    map({ "n", "v" }, "k", "gk")
    -- easy splits
    map("n", "\\", "<cmd>split<cr>")
    map("n", "|", "<cmd>vsplit<cr>")
    -- better increment/decrement
    map("n", "-", "<c-x>")
    map("n", "+", "<c-a>")
    map("x", "+", "g<c-a>")
    map("x", "-", "g<c-x>")
    -- line text-objects
    map("x", "il", "g_o^")
    map("o", "il", ":normal vil<cr>")
    map("x", "al", "$o^")
    map("o", "al", ":normal val<cr>")
    -- type template string
    map("i", ";mk", "<++>")
    map("i", "<S-Tab>", "<C-V><Tab>")
    -- terminal mappings
    map("t", "<leader><esc>", "<c-\\><c-n>")
    map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>")
    map("t", "<c-h>", "<c-\\><c-n><c-w>h")
    map("t", "<c-j>", "<c-\\><c-n><c-w>j")
    map("t", "<c-k>", "<c-\\><c-n><c-w>k")
    map("t", "<c-l>", "<c-\\><c-n><c-w>l")
    -- cmp lsp auto complete
    map("i", "<c-x><c-o>", function()
      require("cmp").complete { config = { sources = { { name = "nvim_lsp" } } } }
    end)
    map("", "<c-e><c-e>", "<Plug>SendLine")
    map("", "<c-e>", "<Plug>Send")

    map("x", "J", function()
      require("syntax-tree-surfer").surf("next", "visual")
    end)
    map("x", "K", function()
      require("syntax-tree-surfer").surf("prev", "visual")
    end)
    map("x", "H", function()
      require("syntax-tree-surfer").surf("parent", "visual")
    end)
    map("x", "L", function()
      require("syntax-tree-surfer").surf("child", "visual")
    end)
    map("x", "<c-j>", function()
      require("syntax-tree-surfer").surf("next", "visual", true)
    end)
    map("x", "<c-l>", function()
      require("syntax-tree-surfer").surf("next", "visual", true)
    end)
    map("x", "<c-k>", function()
      require("syntax-tree-surfer").surf("prev", "visual", true)
    end)
    map("x", "<c-h>", function()
      require("syntax-tree-surfer").surf("prev", "visual", true)
    end)
    map("n", "<c-down>", function()
      require("syntax-tree-surfer").move("n", false)
    end)
    map("n", "<c-right>", function()
      require("syntax-tree-surfer").move("n", false)
    end)
    map("n", "<c-up>", function()
      require("syntax-tree-surfer").move("n", true)
    end)
    map("n", "<c-left>", function()
      require("syntax-tree-surfer").move("n", true)
    end)
  end,
}
