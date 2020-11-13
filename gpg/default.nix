{ pkgs, ... }:

{
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
}
