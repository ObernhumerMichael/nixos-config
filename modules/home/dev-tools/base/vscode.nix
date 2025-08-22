{
  config,
  pgks,
  lib,
  ...
}:

let
  font = config.stylix.fonts.monospace.name;
in
{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        userSettings = {
          "workbench.sideBar.location" = "right";

          "editor.minimap.enabled" = false;
          "editor.formatOnSave" = true;
          "editor.lineNumbers" = "relative";

          "chat.editor.fontFamily" = lib.mkForce font;
          "debug.console.fontFamily" = lib.mkForce font;
          "editor.fontFamily" = lib.mkForce font;
          "editor.inlayHints.fontFamily" = lib.mkForce font;
          "editor.inlineSuggest.fontFamily" = lib.mkForce font;
          "markdown.preview.fontFamily" = lib.mkForce font;
          "scm.inputFontFamily" = lib.mkForce font;

          "editor.fontSize" = lib.mkForce 14;
          "debug.console.fontSize" = lib.mkForce 14;
          "chat.editor.fontSize" = lib.mkForce 14;
          "terminal.integrated.fontSize" = lib.mkForce 14;

          "terminal.integrated.tabs.enabled" = false;
          "git.enableSmartCommit" = true;

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
        };
      };
    };
  };
}
