{
  # https://github.com/anotherhadi/nixy
  description = ''
    Nixy simplifies and unifies the Hyprland ecosystem with a modular, easily customizable setup.
    It provides a structured way to manage your system configuration and dotfiles with minimal effort.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # stylix.url = "github:danth/stylix";
    # apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # nixcord.url = "github:kaylorben/nixcord";
    sops-nix.url = "github:Mic92/sops-nix";
    # nixarr.url = "github:rasmus-kirk/nixarr";
    # nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # spicetify-nix = {
    #   url = "github:Gerg-L/spicetify-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # search-nixos-api.url = "github:anotherhadi/search-nixos-api";
  };

  outputs = inputs @ {nixpkgs, ...}: {
    nixosConfigurations = {
      void-fw13 =
        nixpkgs.lib.nixosSystem {
          modules = [
            {
              nixpkgs.overlays = [];
              _module.args = {inherit inputs;};
            }
            inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
            inputs.home-manager.nixosModules.home-manager
            # inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            ./hosts/void-fw13/configuration.nix
          ];
        };
      # Jack is my server
      # jack = nixpkgs.lib.nixosSystem {
      #   modules = [
      #     {_module.args = {inherit inputs;};}
      #     inputs.home-manager.nixosModules.home-manager
      #     inputs.stylix.nixosModules.stylix
      #     inputs.sops-nix.nixosModules.sops
      #     inputs.nixarr.nixosModules.default
      #     inputs.search-nixos-api.nixosModules.search-nixos-api
      #     ./hosts/server/configuration.nix
      #   ];
      # };
    };
  };
}
