{
  config,
  pgks,
  lib,
  ...
}:

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
        };
      };
    };
  };
}
