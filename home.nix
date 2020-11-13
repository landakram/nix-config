{ pkgs, ... }:

{
  home.stateVersion = "20.09";

  imports = [
    ./zsh
    ./git
    ./packages.nix
  ];

  home.username = "mark";
  home.homeDirectory = "/Users/mark";

  programs.home-manager.enable = true;

  programs.go.enable = true;

  programs.gpg = {
    enable = true;
    settings = {
      default-key = "54583DDF0BD31A45";
      keyid-format = "LONG";
      keyserver = "hkp://keys.gnupg.net";
      keyserver-options = "auto-key-retrieve";
      auto-key-locate = "cert pka ldap hkp://keys.gnupg.net";
    };
  };

  home.packages = [
    pkgs.pinentry_mac
  ];
  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
    default-cache-ttl 2400
    max-cache-ttl 7200
  '';

  programs.keychain = {
    enable = true;
    keys = [ "id_rsa" "54583DDF0BD31A45" ];
    agents = [ "ssh" "gpg" ];
    inheritType = "any";
  };

  programs.direnv.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.Firefox;
  };

  programs.fzf.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacsMacport;
  };

}
