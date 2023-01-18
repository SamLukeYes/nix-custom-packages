{ lib
, stdenvNoCC
, fetchpatch
, fetchzip
, arch-install-scripts
, asciidoc
, bash
, binutils
, breezy
, btrfs-progs
, coreutils
, curl
, diffutils
, findutils
, gawk
, gettext
, git
, glibc
, gnugrep
, gnum4
, gnupg
, gnused
, gzip
, libarchive
, mercurial
, openssh
, pacman
, rsync
, subversion
, systemd
, util-linux
, zstd
, rp ? ""
}:

let
  path = lib.makeBinPath [
    "${placeholder "out"}"
    arch-install-scripts
    bash
    binutils
    breezy
    btrfs-progs
    coreutils
    diffutils
    findutils
    gawk
    gettext
    git
    glibc
    gnugrep
    gnupg
    gnused
    gzip
    libarchive
    mercurial
    openssh
    pacman
    rsync
    subversion
    systemd
    util-linux
  ];

  stdenv = stdenvNoCC.override {
    shell = "${bash}/bin/bash";
  };

in stdenv.mkDerivation rec {
  pname = "devtools";
  version = "20230105";

  src = fetchzip {
    url = "${rp}https://gitlab.archlinux.org/archlinux/devtools/-/archive/${version}/devtools-${version}.zip";
    hash = "sha256-f3W6CMPXV/UcjJb+AioQo4reKo/3Hyfu42pd/YdFsxA=";
  };

  makeFlags = [ "PREFIX=$(out)" ];

  nativeBuildInputs = [ asciidoc gnum4 ];

  postPatch = ''
    for script in \
      ./lib/common.sh \
      ./src/makechrootpkg.in \
      ./src/makerepropkg.in \
      ./src/offload-build.in \
      ./src/sogrep.in
    do
      substituteInPlace $script \
        --replace "/usr/share/makepkg" "${pacman}/share/makepkg" \
        --replace "/usr/share/devtools" "$out/share/devtools"
    done
    for conf in ./config/makepkg/*.conf; do
      substituteInPlace $conf \
        --replace "/usr/bin/curl" "${curl}/bin/curl" \
        --replace "/usr/bin/rsync" "${rsync}/bin/rsync" \
        --replace "/usr/bin/scp" "${openssh}/bin/scp"
    done
    echo "export PATH=${path}:\$PATH" >> ./lib/common.sh
  '';

  meta = with lib; {
    broken = versionAtLeast bash.version "5.2";
    description = "[Experimental] Tools for Arch Linux package maintainers";
    homepage = "https://gitlab.archlinux.org/archlinux/devtools";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}