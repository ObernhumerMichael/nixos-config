{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    jetbrains.idea
    # rstudio compiles as C++17, but boost built with gcc 16 (default C++20)
    # no longer exports the Boost.URL symbols a C++17 consumer links against
    (rstudio.override {
      boost191 = boost191.override { extraB2Args = [ "cxxstd=17" ]; };
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
