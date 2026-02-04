{
  pkgs,
  inputs,
  ...
}: let 
  username = "muhammad";
in {
  config = {
    system.primaryUser = username;

    home-manager.backupFileExtension = "hbak";

    # Available users in the machine
    users.users = {
      ${username} = {
        home = "/Users/${username}";
        description = "Muhammad";
        shell = pkgs.zsh;

        # openssh.authorizedKeys.keys = lib.strings.splitString "\n" (
        #   builtins.readFile (
        #     builtins.fetchurl {
        #       url = "https://github.com/lambdajon.keys";
        #       sha256 = "440dac32fb3ecd060c17f78ad7c34422fefaaccf525c75c3c8dfd5ce86ef516e";
        #     }
        #   )
        # );
      };
    };
  };
}
