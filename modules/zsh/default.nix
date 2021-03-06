{ pkgs, lib, config, ... }:

with lib; let
  cfg = config.landakram.programs.zsh;
in {
  options = {
    landakram.programs.zsh = {
      enable = mkEnableOption "landakram's zsh";
    };
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        vi = "vim";
      };

      history = {
        save = 10000;
        share = true;
        size = 10000;
      };

      initExtra = ''
      function virtualenv_info { [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') ' }

      bindkey -e

      # Show selected item in tab completion
      zstyle ':completion:*' menu select

      # Let alt-backspace delete to slashes, which is more consistent with
      # fish's behavior
      backward-kill-dir () {
          local WORDCHARS=''${WORDCHARS/\/}
          zle backward-kill-word
      }
      zle -N backward-kill-dir
      bindkey '^[^?' backward-kill-dir

      # Load keychain (ssh-agent, gpg-agent)
      eval $(keychain --quiet --inherit any --eval --agents ssh,gpg -Q id_rsa 54583DDF0BD31A45)

      bindkey -M emacs '^P' history-substring-search-up
      bindkey -M emacs '^N' history-substring-search-down

      bindkey '^R' zaw-history
      bindkey -M filterselect '^R' down-line-or-history
      bindkey -M filterselect '^S' up-line-or-history
      bindkey -M filterselect '^E' accept-search
      zstyle ':filter-select:highlight' matched fg=green
      zstyle ':filter-select' max-lines 3
      zstyle ':filter-select' case-insensitive yes # enable case-insensitive 
      zstyle ':filter-select' extended-search yes # see below
    '';

      envExtra = ''
      export PATH=~/.local/bin:/usr/local/texlive/2016/bin/x86_64-darwin/:~/go/bin/:$PATH
      export NVM_LAZY_LOAD=true
      export NVM_COMPLETION=true
      export EDITOR=vim
      export CLICOLOR=1
      export JAVA_HOME="$(/usr/libexec/java_home)"

      export GO111MODULE=on
    '';

      zplug = {
        enable = true;
        plugins = [
          {
            name = "landakram/lambda-mod-zsh-theme";
            tags = ["as:theme"];
          }
          {
            name = "zsh-users/zsh-autosuggestions";
          }
          {
            name = "zsh-users/zsh-history-substring-search";
          }
          {
            name = "lukechilds/zsh-nvm";
          }
          {
            name = "zsh-users/zaw";
          }
          {
            name = "zsh-users/zsh-syntax-highlighting";
            tags = ["defer:2"];
          }
        ];
      };
    };
  };
}
