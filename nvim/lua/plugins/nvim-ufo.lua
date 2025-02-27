return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  name = "ufo",
  config = function ()
    local ufo = require("ufo")
    ufo.setup()
  end
}
