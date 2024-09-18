{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  sshuttle = inputs.sshuttle.packages.${pkgs.stdenv.system};
  colmena = inputs.colmena.packages.${pkgs.stdenv.system};
in
{
  env.GREET = "devenv";

  packages = [
    pkgs.git
    sshuttle.sshuttle
    colmena.colmena
  ];

  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

}
