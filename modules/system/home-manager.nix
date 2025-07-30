# Home-manager configuration for NixOS
{
  config,
  inputs,
  custom,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {inherit inputs custom;};
    users."${custom.variables.username}" = {
      imports = custom.modules.home-manager;
      home = {
        homeDirectory = "/home/" + custom.variables.username;
        packages = custom.packages.user;
        stateVersion = custom.variables.stateVersion;
      };
      programs.home-manager.enable = true;
    };
  };
}
