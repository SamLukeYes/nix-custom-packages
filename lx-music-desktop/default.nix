{ lib
, fetchurl
, mkElectronAppImage
, stdenv
, rp ? ""
}:

mkElectronAppImage rec {
  pname = "lx-music-desktop";
  version = "2.4.1";
  
  src = fetchurl {
    url = "${rp}https://github.com/lyswhut/${pname}/releases/download/v${version}/${pname}-v${version}-x64.AppImage";
    hash = "sha256-uUhE040lZ0YNLRwEfsQlmj1h0Hx0IQOmkeRJD7bs6Ao=";
  };

  runtimeLibs = [ stdenv.cc.cc.lib ];

  meta = {
    description = "A music application based on electron";
    homepage = "https://lxmusic.toside.cn";
    license = lib.licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
}