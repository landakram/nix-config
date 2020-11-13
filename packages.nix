{ pkgs, ... }:

with pkgs;
{
  home.packages = [
    htop
    fortune
    tree
    ripgrep
    telnet
    jdk11
    bfg-repo-cleaner
    clojure
    python3
    ruby
    #racket
    #chicken
  ];
}
