{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    unstable.claude-code
    nodejs
    # unstable: rstudio on 26.05 needs EOL electron_41 (marked insecure)
    # hunspellDicts.all duplicates every dict file -> ln "File exists" in configurePhase
    (unstable.rstudio.override {
      hunspellDicts = builtins.removeAttrs unstable.hunspellDicts [ "all" ];
    })
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  imports = [
    ./vscode.nix
  ];
}
