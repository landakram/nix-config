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
  ];
}
