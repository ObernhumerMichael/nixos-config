{
  config,
  pkgs,
  lib,
  ...
}:

let
  font = config.stylix.fonts.monospace.name;
  marketplace = pkgs.nix-vscode-extensions.vscode-marketplace-release;
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # Standard VS Code (Non-FHS)

    profiles.default = {
      extensions = [
        marketplace.bbenoist.nix
        marketplace.bierner.github-markdown-preview
        marketplace.bierner.markdown-checkbox
        marketplace.bierner.markdown-emoji
        marketplace.bierner.markdown-footnotes
        marketplace.bierner.markdown-mermaid
        marketplace.bierner.markdown-preview-github-styles
        marketplace.bierner.markdown-yaml-preamble
        marketplace.bmewburn.vscode-intelephense-client
        marketplace.christian-kohler.path-intellisense
        marketplace.davidanson.vscode-markdownlint
        marketplace.docker.docker
        marketplace.ecmel.vscode-html-css
        marketplace.editorconfig.editorconfig
        marketplace.github.copilot-chat
        marketplace.github.vscode-github-actions
        marketplace.james-yu.latex-workshop
        marketplace.jnoortheen.nix-ide
        marketplace.jock.svg
        marketplace.mads-hartmann.bash-ide-vscode
        marketplace.matthewpi.caddyfile-support
        marketplace.ms-azuretools.vscode-containers
        marketplace.ms-azuretools.vscode-docker
        marketplace.ms-python.debugpy
        marketplace.ms-python.python
        marketplace.ms-python.vscode-pylance
        marketplace.ms-python.vscode-python-envs
        marketplace.ms-python.black-formatter
        marketplace.ms-vscode-remote.remote-ssh
        marketplace.ms-vscode-remote.remote-ssh-edit
        marketplace.ms-vscode.remote-explorer
        marketplace.murloccra4ler.leap
        marketplace.naumovs.color-highlight
        marketplace.redhat.java
        marketplace.streetsidesoftware.code-spell-checker
        marketplace.streetsidesoftware.code-spell-checker-british-english
        marketplace.streetsidesoftware.code-spell-checker-german
        marketplace.szaldivar.szaldivar-leap
        marketplace.vivaxy.vscode-conventional-commits
        marketplace.vscjava.vscode-gradle
        marketplace.vscjava.vscode-java-debug
        marketplace.vscjava.vscode-java-dependency
        marketplace.vscjava.vscode-java-pack
        marketplace.vscjava.vscode-java-test
        marketplace.vscjava.vscode-maven
        marketplace.vscodevim.vim
        marketplace.xdebug.php-debug
        marketplace.xdebug.php-pack
        marketplace.yzhang.markdown-all-in-one
        marketplace.zobo.php-intellisense
      ];

      userSettings = {
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.lineNumbers" = "relative";

        # Fonts
        "chat.editor.fontFamily" = lib.mkForce font;
        "debug.console.fontFamily" = lib.mkForce font;
        "editor.fontFamily" = lib.mkForce font;
        "editor.inlayHints.fontFamily" = lib.mkForce font;
        "editor.inlineSuggest.fontFamily" = lib.mkForce font;
        "markdown.preview.fontFamily" = lib.mkForce font;
        "scm.inputFontFamily" = lib.mkForce font;

        # Font Sizes
        "editor.fontSize" = lib.mkForce 14;
        "debug.console.fontSize" = lib.mkForce 14;
        "chat.editor.fontSize" = lib.mkForce 14;
        "terminal.integrated.fontSize" = lib.mkForce 14;

        "terminal.integrated.tabs.enabled" = false;
        "git.enableSmartCommit" = true;
        "workbench.colorTheme" = "Stylix";

        "editor.rulers" = [
          80
          120
        ];

        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            "before" = [ "s" ];
            "commands" = [ "leap.findForward" ];
          }
          {
            "before" = [ "S" ];
            "commands" = [ "leap.findBackward" ];
          }
        ];
        "vim.useSystemClipboard" = true;
        "redhat.telemetry.enabled" = false;
        "latex-workshop.formatting.latex" = "latexindent";
        "[markdown]" = {
          "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
        };
      };
    };
  };
}
