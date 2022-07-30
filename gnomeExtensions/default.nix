{ rp ? "" }:

with (import <nixpkgs> {});

{
  onedrive = callPackage ./onedrive { inherit rp; };
}