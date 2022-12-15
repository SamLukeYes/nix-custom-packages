{ 
  pkgs ? import <nixpkgs> {},
  rp ? "",
}:

with pkgs; {
  archlinux = recurseIntoAttrs (import ./archlinux {
    inherit pkgs rp;
  });

  electronic-wechat = callPackage ./electronic-wechat { inherit rp; };
  
  lx-music-desktop = callPackage ./electronAppImage rec {
    pname = "lx-music-desktop";
    version = "1.22.3";
    description = "A music application based on electron";
    homepage = "https://lxmusic.toside.cn";
    license = lib.licenses.asl20;
    src = fetchurl {
      url = "${rp}https://github.com/lyswhut/${pname}/releases/download/v${version}/${pname}-v${version}-x64.AppImage";
      hash = "sha256-mlT1FOPeg9mMwOVmRdy+fm/PR3ME0RsftQ9BcIbuauI=";
    };
  };

  nodePackages = recurseIntoAttrs (import ./nodePackages/override.nix {
    inherit pkgs;
  });

  ppet = callPackage ./electronAppImage rec {
    electron = electron_19;
    pname = "ppet3";
    version = "3.3.0";
    description = "Live2D on desktop";
    homepage = "https://github.com/zenghongtu/PPet";
    license = lib.licenses.mit;
    src = fetchurl {
      url = "${rp}${homepage}/releases/download/v${version}/PPet3-${version}.AppImage";
      hash = "sha256-zdRZm0T6tBqNxvaUaiWAlAfuug/CQX0S+B5uDNdiQ/s=";
    };
  };
}