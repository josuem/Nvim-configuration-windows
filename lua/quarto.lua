return {
  -- General config from https://github.com/quarto-dev/quarto-nvim/tree/main
  -- this code is getting from github project.
  "quarto-dev/quarto-nvim",
  dev = false,
  dependencies = {
    "hrsh7th/nvim-cmp",
    {
      "jmbuhr/otter.nvim",
      config = function()
        require("otter.config").setup({
          lsp = {
            hover = {
              border = require("misc.style").border,
            },
          },
        })
      end,
    },

    "neovim/nvim-lspconfig",
  },
  config = function()
    require("quarto").setup({
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = "all", -- 'curly' or 'all'
        languages = { "r", "python", "julia", "bash", "lua", "html" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "K",
        definition = "gd",
        rename = "<leader>lR",
        references = "gr",
      },
    })
  end,
  -- ** vim-slime, https://github.com/jpalardy/vim-slime **
  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    --  init = function()
    --    vim.b["quarto_is_" .. "python" .. "_chunk"] = false
    --    Quarto_is_in_python_chunk = function()
    --      require("otter.tools.functions").is_otter_language_context("python")
    --    end

    --    vim.cmd([[
    --    function SlimeOverride_EscapeText_quarto(text)
    --    call v:lua.Quarto_is_in_python_chunk()
    --    if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
    --    return ["%cpaste -q", "\n", a:text, "--", "\n"]
    --    else
    --    return a:text
    --    end
    --    endfunction
    --    ]])

    --    local function mark_terminal()
    --      vim.g.slime_last_channel = vim.b.terminal_job_id
    --      vim.print(vim.g.slime_last_channel)
    --    end

    --    local function set_terminal()
    --      vim.b.slime_config = { jobid = vim.g.slime_last_channel }
    --    end

    --    vim.b.slime_cell_delimiter = "# %%"

    --    -- slime, neovvim terminal
    --    vim.g.slime_target = "neovim"
    --    vim.g.slime_python_ipython = 1

    --    -- -- slime, tmux
    --    -- vim.g.slime_target = 'tmux'
    --    -- vim.g.slime_bracketed_paste = 1
    --    -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

    --    local function toggle_slime_tmux_nvim()
    --      if vim.g.slime_target == "tmux" then
    --        pcall(function()
    --          vim.b.slime_config = nil
    --          vim.g.slime_default_config = nil
    --        end)
    --        -- slime, neovvim terminal
    --        vim.g.slime_target = "neovim"
    --        vim.g.slime_bracketed_paste = 0
    --        vim.g.slime_python_ipython = 1
    --      elseif vim.g.slime_target == "neovim" then
    --        pcall(function()
    --          vim.b.slime_config = nil
    --          vim.g.slime_default_config = nil
    --        end)
    --        -- -- slime, tmux
    --        vim.g.slime_target = "tmux"
    --        vim.g.slime_bracketed_paste = 1
    --        vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
    --      end
    --    end

    --    require("which-key").register({
    --      ["<leader>cm"] = { mark_terminal, "mark terminal" },
    --      ["<leader>cs"] = { set_terminal, "set terminal" },
    --      ["<leader>ct"] = { toggle_slime_tmux_nvim, "toggle tmux/nvim terminal" },
    --    })
    --  end,
  },
}
