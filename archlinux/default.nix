{ 
  pkgs ? import <nixpkgs> {},
  rp ? "",
}:

with pkgs; rec {
  archlinux-keyring = callPackage ./archlinux-keyring { inherit rp; };

  asp = callPackage ./asp { inherit rp; };

  arch-install-scripts = callPackage "${
    builtins.fetchTarball "${rp}https://github.com/SamLukeYes/nixpkgs/archive/arch-install-scripts.tar.gz"
  }/pkgs/tools/misc/arch-install-scripts" {};

  devtools = callPackage ./devtools { inherit rp; };

  pacman = callPackage "${
    builtins.fetchTarball "${rp}https://github.com/SamLukeYes/nixpkgs/archive/pacman.tar.gz"
  }/pkgs/tools/package-management/pacman" {};

  pacman-gnupg = callPackage ./pacman/gnupg.nix {
    keyrings = [ archlinux-keyring ];
  };

  paru-unwrapped = callPackage ./paru/unwrapped.nix { inherit rp; };

  paru = callPackage ./paru { inherit asp devtools paru-unwrapped; };
}