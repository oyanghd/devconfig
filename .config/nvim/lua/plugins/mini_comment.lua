return {
  {
    "echasnovski/mini.comment",
    version = false,
    enabled = false,
    config = function()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return vim.bo.commentstring
          end,
        },
      })
    end,
  },
}
