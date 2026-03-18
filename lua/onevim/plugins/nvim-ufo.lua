return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  config = function()
    require("ufo").setup({
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, _, _)
        local new_virt_text = {}
        local line_count = end_lnum - lnum
        local prefix = ("[%d lines] "):format(line_count)

        table.insert(new_virt_text, { prefix, "MoreMsg" })

        for _, chunk in ipairs(virt_text) do
          table.insert(new_virt_text, chunk)
        end

        return new_virt_text
      end,
    })

    vim.o.foldmethod = "manual"

    vim.keymap.set("n", "zK", function()
      require("ufo").peekFoldedLinesUnderCursor()
    end, { desc = "Peek fold" })
  end,
}
