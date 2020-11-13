{ config, pkgs, options, ... }:

with pkgs.stdenv; with lib; {
  imports = [
    <home-manager/nix-darwin>
    ./link-apps
  ];

  nix.nixPath = options.nix.nixPath.default;

  nixpkgs.overlays = import ./overlays;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.vim
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  users.users.mark = {
    name = "mark";
    home = "/Users/mark";
    shell = pkgs.zsh;
  };

  home-manager.users.mark = import ./home.nix;
  home-manager.useGlobalPkgs = true;

  # Add home-manager applications to `system.build.applications` so they will be linked
  # by services.link-apps.
  system.build.applications = pkgs.lib.mkForce (pkgs.buildEnv {
    name = "applications";
    paths = config.environment.systemPackages ++ config.home-manager.users.mark.home.packages;
    pathsToLink = "/Applications";
  });

  services.link-apps = {
    enable = true;
    userName = config.users.users.mark.name;
    userHome = config.users.users.mark.home;
  };

  services.lorri.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
