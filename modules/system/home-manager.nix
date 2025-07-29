# Home-manager configuration for NixOS
{
  config,
  inputs,
  ...
}:
let
  var = config.var;
  modules = config.modules;
  packages = config.packages;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {inherit inputs var modules;};
    users."${var.username}" = {
      imports = modules.home-manager;
      home = {
        homeDirectory = "/home/" + var.username;
        packages = packages.user;
        stateVersion = var.stateVersion;
      };
      programs.home-manager.enable = true;
    };
  };
}
