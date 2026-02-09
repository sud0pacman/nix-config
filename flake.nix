{
  # ============================================================================================
  #  ooo        ooo            oooo                                                       .o8
  #  `88.       `88'           `888                                                      "888
  #   888b     d888  oooo  oooo 888 .oo.    .oooo.   ooo. .oo.  ooo. .oo.    .oooo.    .oooo888
  #   8 Y88. .P  88  `888  `888 888P"Y88b  `P  )88b  `888P"Y88b `888P"Y88b  `P  )88b  d88' `888
  #   8  `888'   88   888   888 888   888   .oP"888   888   888  888   888   .oP"888  888   888
  #   8    Y     88   888   888 888   888  d8(  888   888   888  888   888  d8(  888  888   888
  #  o8o        o88o  `V88V"V8P o888o o888o `Y888""8o o888o o888o o888o o888o `Y888""8o `Y8bod88P
  # ============================================================================================
  # Extra nix configurations to inject to flake scheme
  # => use if something doesn't work out of box or when despaired...
  # nixConfig = {
  #   experimental-features = [
  #     "nix-command"
  #     "flakes"
  #     "pipe-operators"
  #   ];
  #   extra-substituters = [ "https://cache.xinux.uz/" ];
  #   extra-trusted-public-keys = [ "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0=" ];
  # };

  # inputs are other flakes you use within your own flake, dependencies
  # for your flake, etc.
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # Nixpkgs Unstable for latest packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-darwin for macOS systems management
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Xinux library
    xinux-lib = {
      url = "github:xinux-org/lib/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Disko for easier partition management
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Pre commit hooks for git
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative Firefox plugins (a.k.a addons)
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Good old Apple's Ligaturized SF Mono font
    sf-mono-liga = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    # Ready to go hardware related configurations
    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = inputs:
  # Let the xinux-lib/mkFlake handle literally EVERYTHING
    inputs.xinux-lib.mkFlake {
      # Pass the vibe check
      inherit inputs;

      # Indicate root of the project
      # for library functions (nix issue)
      src = ./.;

      # Extra nix flags to set
      outputs-builder = channels: {
        formatter = channels.nixpkgs.nixfmt-tree;
      };

      # Globally applied nixpkgs settings
      channels-config = {
        # Disable if you don't want unfree packages
        allowUnfree = true;
        # Disable if you don't want linux thingies on mac
        allowUnsupportedSystem = true;
        # Workaround for https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = _: true;
        # Let the system use fucked up programs
        allowBroken = true;
        # Allow NVIDIA's prop. software
        nvidia.acceptLicense = true;
      };

      # Default imported modules for all nixos targets
      systems.modules.nixos = with inputs; [
        disko.nixosModules.disko
      ];

      # Extra project metadata
      xinux = {
        # Namespace for overlay, lib, packages
        namespace = "arava";
        # Example: lib.orzklv.match ...

        # For data extraction
        meta = {
          name = "arava";
          title = "Orzklv's Personal Flake Configuration";
        };
      };
    };
}
