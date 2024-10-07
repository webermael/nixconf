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
    };

    # make own module
    # resp. own module(s) for shell utilities (zoxide etc.)
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
