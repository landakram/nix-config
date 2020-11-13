{ pkgs, ... }:

{
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
}
