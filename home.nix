{ pkgs, ... }:

{
  home.stateVersion = "20.09";

  imports = [
    ./modules/zsh
    ./modules/git
    ./modules/gpg
    ./misc.nix
  ];

  home.username = "mark";
  home.homeDirectory = "/Users/mark";

  programs.home-manager.enable = true;

  landakram.programs.zsh.enable = true;
  landakram.programs.git.enable = true;
  landakram.programs.gpg.enable = true;

  programs.keychain = {
    enable = true;
    keys = [ "id_rsa" "54583DDF0BD31A45" ];
    agents = [ "ssh" "gpg" ];
    inheritType = "any";
  };

  programs.direnv.enable = true;
  programs.fzf.enable = true;
  programs.z-lua.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.go.enable = true;
}
