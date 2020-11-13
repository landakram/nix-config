{ pkgs, ... }:

{
  home.stateVersion = "20.09";

  imports = [
    ./zsh
    ./git
    ./gpg
    ./packages.nix
  ];

  home.username = "mark";
  home.homeDirectory = "/Users/mark";

  programs.home-manager.enable = true;

  programs.go.enable = true;

  programs.keychain = {
    enable = true;
    keys = [ "id_rsa" "54583DDF0BD31A45" ];
    agents = [ "ssh" "gpg" ];
    inheritType = "any";
  };

  programs.direnv.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  programs.fzf.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
