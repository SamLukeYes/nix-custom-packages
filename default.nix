{ rp ? "" }:

with (import <nixpkgs> {});

{
  lx-music-desktop = callPackage ./lx-music-desktop { inherit rp; };
}