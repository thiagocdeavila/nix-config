return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp" },
      { "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[S]earch [K]eymaps" },
      { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[S]earch [F]iles" },
      { "<leader>ss", function() require("telescope.builtin").builtin() end, desc = "[S]earch [S]elect Telescope" },
      { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch current [W]ord" },
      { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep" },
      { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
      { "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "Find existing buffers" },
      {
        "<leader>sa",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            initial_mode = "normal",
          })
        end,
        desc = "Search File Browser",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          hidden = true,
          respect_gitignore = false,
          mappings = {
            ["n"] = {
              ["c"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }

      telescope.setup(opts)
      telescope.load_extension("file_browser")
    end,
  },
}
