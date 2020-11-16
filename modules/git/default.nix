{ pkgs, lib, config, ... }:

with lib; let
  cfg = config.landakram.programs.git;
in {
  options = {
    landakram.programs.git = {
      enable = mkEnableOption "landakram's git";
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      userName = "Mark Hudnall";
      userEmail = "me@markhudnall.com";

      extraConfig = {
        credential = {
          helper = "osxkeychain";
        };
        color = {
          ui = true;
        };
        push = {
          default = "matching";
        };
      };

      ignores = [
        # Mac OS X hidden files
        ".DS_Store"

        # Vim swap files
        ".*.sw?"
        "*un~"

        # Pow and Powder config
        "/.pow*"

        # RVM and rbenv
        "/.rvmrc"
        "/.rbenv-version"

        "node_modules"
        "dump.rdb"
      ];
    };
  };
}
