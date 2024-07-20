return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufr)
        local gs = package.loaded.gitsigns

        local function map(keys, fn, opts)
          if opts.desc then
            opts.desc = "(Git) " .. opts.desc
          end

          vim.keymap.set(opts.mode or "n", keys, fn, { buffer = bufr, desc = opts.desc })
        end

        map("]h", gs.next_hunk, { desc = "Next Hunk" })
        map("[h", gs.prev_hunk, { desc = "Previous Hunk" })
        map("<leader>ghs", gs.stage_hunk, { mode = { "n", "v" }, desc = "Stage Hunk" })
        map("<leader>ghr", gs.reset_hunk, { mode = { "n", "v" }, desc = "Reset Hunk" })
        map("<leader>ghu", gs.undo_stage_hunk, { mode = { "n", "v" }, desc = "Undo Stage Hunk" })
        map("<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
        map("<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
        map("<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
        map("<leader>ghb", gs.blame_line, { desc = "Blame Line" })
        map("<leader>ghB", function() gs.blame_line({ full = true }) end, { desc = "Blame Line (Full)" })
        map("<leader>ghd", gs.diffthis, { desc = "Diff This" })
        map("<leader>ghD", function() gs.diffthis("~") end, { desc = "Diff This ~" })
        map("ih", ":<C-U>Gitsigns select_hunk<CR>", { mode = { "o", "x" }, desc = "Select Hunk" })
      end,
    },
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gg", function() require("neogit").open() end, desc = "Neogit" },
      { "<leader>gc", function() require("neogit").open({ "commit" }) end, desc = "Neogit Commit" },
    },
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}
