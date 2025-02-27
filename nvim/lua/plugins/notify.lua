return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#1e1e1e",
      render = "compact",
      stages = "fade_in_slide_out",
      timeout = 3000,
      icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = " ",
      },
    })
    vim.notify = notify
  end,
}
