{
  config,
  pkgs,
  lib,
  ...
}:

let
  font = config.stylix.fonts.monospace.name;
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
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
