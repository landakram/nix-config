# nix-config

My nix configuration.

## Installation

1. Install nix
2. Install nix-darwin

  In addition to the regular installation steps (which were painful), I had to add darwin as a channel for my user:

  ```sh
  nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
  nix-channel --update
  ```

3. Install home-manager

  ```sh
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  ```

4. Clone this repo into `~/.nixpkgs`

5. Run:

  ``` sh
  darwin-rebuild switch
  ```

### Alfred

Mac apps built with Nix don't play well with Alfred / spotlight search. To work around this, we create aliases for nix applications and place them in `$HOME/Applications/Nix`. See [this issue](https://github.com/LnL7/nix-darwin/issues/139) for more context.

We need to configure Alfred to index aliases by going to `Alfred Preferences -> Features -> Default Results -> Extras -> Advanced...` and dragging in one of the aliases in `$HOME/Applications/Nix`.

## Updating

Root owns the nixpkgs channel so sudo is needed to update that:

```sh
sudo nix-channel --update
```

User channels should be updated as well:

```sh
nix-channel --update
```

