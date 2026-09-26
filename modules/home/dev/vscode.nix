{ config, ... }:

let
  font = config.stylix.fonts.monospace.name;
in
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.lineNumbers" = "relative";
        "workbench.panel.showLabels" = false;

        # Fonts
        "chat.editor.fontFamily" = font;
        "debug.console.fontFamily" = font;
        "editor.fontFamily" = font;
        "editor.inlayHints.fontFamily" = font;
        "editor.inlineSuggest.fontFamily" = font;
        "markdown.preview.fontFamily" = font;
        "scm.inputFontFamily" = font;

        # Font Sizes
        "editor.fontSize" = 14;
        "debug.console.fontSize" = 14;
        "chat.editor.fontSize" = 14;
        "terminal.integrated.fontSize" = 14;

        "terminal.integrated.tabs.enabled" = false;
        "git.enableSmartCommit" = true;
        "workbench.colorTheme" = "Catppuccin Mocha";

        "editor.rulers" = [
          80
          120
        ];
        "latex-workshop.latex.tools" = [
          {
            "name" = "latexmk";
            "command" = "latexmk";
            "args" = [
              "-shell-escape"
              "-synctex=1"
              "-interaction=nonstopmode"
              "-file-line-error"
              "-pdf"
              "-outdir=%OUTDIR%"
              "%DOC%"
            ];
            "env" = { };
          }
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
        "[java]" = {
          "editor.defaultFormatter" = "josevseb.google-java-format-for-vs-code";
        };
      };
    };
  };
}
