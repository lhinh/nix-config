{ pkgs, config, ... }:
{
  home-manager.users.slippy.programs.git = {
    enable = true;
    settings.user.name = "Loc Hinh";
    settings.user.email = "lhinh3431@gmail.com";
    settings.core.editor = "vim";
    settings.init.defaultBranch = "main";
  };
}
