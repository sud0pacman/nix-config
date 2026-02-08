{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "sud0pacman";
      user.email = "mukhammad.kammoliddin@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        http.sslVerify = false;
        pull.rebase = false;

        # safe.directory = [
        #   "/home/bahrom/workplace/bahrom04/nix-config"
        #   # Add other safe directories here if needed
        # ];
      };
    };

    signing = {
      signByDefault = true;
      key = "0C0976C400115495";
    };

    # Git ignores
    ignores = [
      ".idea"
      ".DS_Store"
      "nohup.out"
      "node_modules"
      "result"
      ".direnv"
    ];
  };
}