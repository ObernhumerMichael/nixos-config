{
  description = "Flexible development template (Python-focused)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      python = pkgs.python311;

      # Define Python packages here
      pythonPackages =
        ps: with ps; [
          requests
          numpy
          black
          pytest
        ];

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          (python.withPackages pythonPackages)

          # Generic build tools (easy to extend)
          pkgs.git
          pkgs.gnumake
          pkgs.cmake
          pkgs.gcc
        ];

        shellHook = ''
          echo "Python dev environment ready 🚀"
          python --version
        '';
      };
    };
}
