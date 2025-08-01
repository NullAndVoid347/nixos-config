{
  # https://github.com/NullAndVoid347/nixos-config
  description = ''
    Modular nixos config that implements flakes, home-manager, sops-nix
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # stylix.url = "github:danth/stylix";
    # apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    # nixcord.url = "github:kaylorben/nixcord";
    # nixarr.url = "github:rasmus-kirk/nixarr";
    # nvf.url = "github:notashelf/nvf";
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
      void-fw13 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./configs/void-fw13 ];
      };
      # void-fw16 = nixpkgs.lib.nixosSystem {
      #   modules = [
      #     {_module.args = {inherit inputs;};}
      #     inputs.home-manager.nixosModules.home-manager
      #     inputs.stylix.nixosModules.stylix
      #     inputs.sops-nix.nixosModules.sops
      #     inputs.nixarr.nixosModules.default
      #     inputs.search-nixos-api.nixosModules.search-nixos-api
      #     ./configs/void-fw16/configuration.nix
      #   ];
      # };
    };
  };
}
