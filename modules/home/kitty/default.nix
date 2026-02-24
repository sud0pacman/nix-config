{ ... }:
{
  xdg.configFile.kitty = {
    source = ./KittyConfs;
    recursive = true;
  };

  programs.kitty = {
    enable = true;
  };
}
