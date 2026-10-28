{
  # nixos-rebuild/nix-gc frontend: `nh os switch`, `nh clean`
  programs.nh = {
    enable = true;
    flake = "/home/user/nixos-config";
    clean = {
      enable = true;
      # always keep the last 5 generations, even if older than 30 days
      extraArgs = "--keep-since 30d --keep 5";
    };
  };
}
