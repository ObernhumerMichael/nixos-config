{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator # Ctrl+hjkl across vim splits and tmux panes
      fzf-lua # fuzzy finder, reuses the fzf from programs.fzf
      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.lua
        p.bash
        p.markdown
        p.java
      ]))
    ];

    initLua = ''
      vim.g.mapleader = " "

      local o = vim.opt
      o.number = true
      o.relativenumber = true
      o.mouse = "a"
      o.clipboard = "unnamedplus"
      o.ignorecase = true
      o.smartcase = true
      o.expandtab = true
      o.shiftwidth = 2
      o.tabstop = 2
      o.undofile = true
      o.scrolloff = 8
      o.splitright = true
      o.splitbelow = true

      vim.api.nvim_create_autocmd("FileType", {
        callback = function() pcall(vim.treesitter.start) end,
      })

      local fzf = require("fzf-lua")
      vim.keymap.set("n", "<leader>f", fzf.files)
      vim.keymap.set("n", "<leader>g", fzf.live_grep)
      vim.keymap.set("n", "<leader>b", fzf.buffers)
      vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
    '';
  };
}
