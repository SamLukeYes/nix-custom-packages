{
  description = "Experimental flake for CI testing";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    packages = import ./default.nix {
      pkgs = import nixpkgs { 
        system = "x86_64-linux";
      };
    };
  };
}