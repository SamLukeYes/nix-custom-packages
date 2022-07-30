{ rp ? "" }:

with (import <nixpkgs> {});

{
  gnomeExtensions = import ./gnomeExtensions { inherit rp; };
  lx-music-desktop = callPackage ./lx-music-desktop { inherit rp; };
}