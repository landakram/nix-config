{ pkgs, lib, config, ... }:

with lib; let
  cfg = config.landakram.programs.gpg;
in
{
  options = {
    landakram.programs.gpg = {
      enable = mkEnableOption "confiuure gpg with defaults and pin entry";
      
      pinentry-program = mkOption {
        default = pkgs.pinentry_mac;
        type = types.attrs;
        description = "Pinentry program for decrypting GPG keys.";
      };

      pinentry-program-bin = mkOption {
        default = "${cfg.pinentry-program}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac";
        type = types.path;
        description = "Bin to use for pinentry. Should be consistent with pinentry-program option.";
      };

      default-key = mkOption {
        default = "54583DDF0BD31A45";
        type = types.str;
        description = "Default GPG key";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.gpg = {
      enable = true;
      settings = {
        default-key = cfg.default-key;
        keyid-format = "LONG";
        keyserver = "hkp://keys.gnupg.net";
        keyserver-options = "auto-key-retrieve";
        auto-key-locate = "cert pka ldap hkp://keys.gnupg.net";
      };
    };

    home.packages = [
      cfg.pinentry-program
    ];
    home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${cfg.pinentry-program-bin}
    default-cache-ttl 2400
    max-cache-ttl 7200
  '';
  };
}
