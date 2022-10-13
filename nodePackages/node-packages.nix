# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "node-forge-1.3.1" = {
      name = "node-forge";
      packageName = "node-forge";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-forge/-/node-forge-1.3.1.tgz";
        sha512 = "dPEtOeMvF9VMcYV/1Wb8CPoVAXtp6MKMlcbAt4ddqmGqUJ6fQZFXkNZNkNlfevtNkGtaSoXf/vNNNSvgrdXwtA==";
      };
    };
    "parse-multipart-data-1.5.0" = {
      name = "parse-multipart-data";
      packageName = "parse-multipart-data";
      version = "1.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse-multipart-data/-/parse-multipart-data-1.5.0.tgz";
        sha512 = "ck5zaMF0ydjGfejNMnlo5YU2oJ+pT+80Jb1y4ybanT27j+zbVP/jkYmCrUGsEln0Ox/hZmuvgy8Ra7AxbXP2Mw==";
      };
    };
  };
in
{
  magireco-cn-local-server = nodeEnv.buildNodePackage {
    name = "magireco-cn-local-server";
    packageName = "magireco-cn-local-server";
    version = "1.6.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/magireco-cn-local-server/-/magireco-cn-local-server-1.6.2.tgz";
      sha512 = "mNRNMXyXy3jzL+zfCg8CsBhcgR481IslhGKrZUjF6aj30EkSTLtVtujbAagRoQ1gxSoJAPUhjLqjj58mw/xrOQ==";
    };
    dependencies = [
      sources."node-forge-1.3.1"
      sources."parse-multipart-data-1.5.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Magia Record CN Local Server";
      homepage = "https://github.com/segfault-bilibili/magireco-cn-local-server#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
