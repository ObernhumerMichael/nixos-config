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
    package = pkgs.vscode;

    profiles.default = {
      extensions = with marketplace; [
        bbenoist.nix
        bierner.github-markdown-preview
        bierner.markdown-checkbox
        bierner.markdown-emoji
        bierner.markdown-footnotes
        bierner.markdown-mermaid
        bierner.markdown-preview-github-styles
        bierner.markdown-yaml-preamble
        bmewburn.vscode-intelephense-client
        christian-kohler.path-intellisense
        davidanson.vscode-markdownlint
        docker.docker
        ecmel.vscode-html-css
        editorconfig.editorconfig
        github.copilot-chat
        github.vscode-github-actions
        james-yu.latex-workshop
        jnoortheen.nix-ide
        jock.svg
        mads-hartmann.bash-ide-vscode
        matthewpi.caddyfile-support
        ms-azuretools.vscode-containers
        ms-azuretools.vscode-docker
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-python.vscode-python-envs
        ms-python.black-formatter
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        murloccra4ler.leap
        naumovs.color-highlight
        redhat.java
        streetsidesoftware.code-spell-checker
        streetsidesoftware.code-spell-checker-british-english
        streetsidesoftware.code-spell-checker-german
        szaldivar.szaldivar-leap
        vivaxy.vscode-conventional-commits
        vscjava.vscode-gradle
        vscjava.vscode-java-debug
        vscjava.vscode-java-dependency
        vscjava.vscode-java-pack
        vscjava.vscode-java-test
        vscjava.vscode-maven
        vscodevim.vim
        xdebug.php-debug
        xdebug.php-pack
        yzhang.markdown-all-in-one
        zobo.php-intellisense
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
