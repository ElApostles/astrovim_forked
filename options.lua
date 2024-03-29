return {
  opt = {
    tabstop = 4, -- insert 4 spaces for a tab
    shiftwidth = 4,
    expandtab = false,
    backup = false, -- creates a backup file
    clipboard = "", -- override to default clipboard settings
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    conceallevel = 0, -- so that `` is visible in markdown files
    hlsearch = true, -- highlight all matches on previous search pattern
    showmode = true,
    number = true,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 4 {default 4}
    shell = vim.fn.expand "/opt/homebrew/bin/fish",

    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
    spellfile = vim.fn.expand "~/.config/nvim/lua/user/spell/en.utf-8.add",
    splitkeep = "screen",
    swapfile = false,
    thesaurus = vim.fn.expand "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
  g = {
    maplocalleader = "\\",
    resession_enabled = true,
    skip_ts_context_commentstring_module = true,
  },
}
