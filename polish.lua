return function()
  vim.cmd [[
  fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
  \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
  \ .'? ("'.a:to.'") : ("'.a:from.'"))'
  endfun
  call SetupCommandAlias("W","w")
  ]]

  vim.filetype.add {
    extension = {
      qmd = "markdown",
    },
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
    },
  }
  require "user.autocmds"
end
