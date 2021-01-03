{ pkgs, ... }:

with pkgs;
{
  home.packages = [
    htop
    wget
    fortune
    tree
    ripgrep
    telnet
    jdk11
    bfg-repo-cleaner
    clojure
    python3
    python37Packages.pipx
    ruby
    cabal-install
    ghc
    clang
    cachix
    chicken
    racket-minimal
    ipfs
    graphviz
    ansible
    sshpass
    kubectl
    watch
    inkscape
    # TODO: Results in an error
    # sandbox-exec: pattern serialization length 67173 exceeds maximum (65535)
    # https://github.com/NixOS/nix/issues/4119
    # texlive.combined.scheme-medium

    solc
  ];
}
