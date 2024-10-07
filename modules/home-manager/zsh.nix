{ pkgs, lib, config, ...}: {

  options = {
    zsh.enable =
      lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
      programs.zsh = {
      enable = true;
      
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 5000;
        path = "$HOME/.zsh_history";
        save = 5000;
        share = true;
        append = true;
        ignoreDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
      };

      historySubstringSearch.enable = true;
      
      # maybe change to something more lightweight at a later point
      oh-my-zsh = {
        enable = true;
        #theme = ?;
        plugins = [
          "colored-man-pages"
          "colorize"
          "fzf"
        ];  
      };

    };

    programs.fzf.enable = true;
  };
}
