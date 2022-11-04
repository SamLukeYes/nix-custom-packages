{
  description = "Experimental flake for CI testing";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in pkgs.recurseIntoAttrs ({
    packages.${system} = import ./default.nix { inherit pkgs; };
  });
}