{
  ...
}:
{
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "24.11";
    username = "muhammad";
  };

  # Let's enable home-manager
  programs.home-manager.enable = true;
}