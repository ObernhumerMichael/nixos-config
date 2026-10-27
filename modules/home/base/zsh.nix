{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    history = {
      path = "$HOME/.zsh_history";
      size = 100000;
      save = 100000;
      ignoreDups = true;
      ignoreAllDups = true;
      share = true;
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "extract"
        "colored-man-pages"
      ];
    };

    plugins = [
      {
        # reminds you of existing aliases (e.g. gst for git status)
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        # fzf-powered tab completion
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];
  };

  programs.starship = {
    enable = true;
  };

  # searchable shell history on Ctrl+R
  programs.atuin = {
    enable = true;
    flags = [
      "--disable-up-arrow"
      "--disable-ai" # no `?` natural-language prompt
    ];
    settings = {
      enter_accept = false; # Enter puts the command on the prompt to edit, doesn't run it
      style = "compact";
      inline_height = 20; # open below the prompt instead of fullscreen
      workspaces = true; # adds a "this git repo" filter mode
      update_check = false; # updates come from the flake
    };
  };
}
