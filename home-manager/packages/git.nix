{ pkgs, config, ... }:
{
  home-manager.users.slippy.programs.git = {
    enable = true;
    userName = "Loc Hinh";
    userEmail = "lhinh3431@gmail.com";
    extraConfig.core.editor = "vim";
    extraConfig.init.defaultBranch = "main";
  };
}
