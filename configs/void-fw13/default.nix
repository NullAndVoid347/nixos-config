{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  custom = {
    variables = (import ./variables.nix { inherit config; inherit lib; }).config.var;
    modules = (import ./modules.nix { inherit config; inherit lib; }).config.modules;
    packages = (import ./packages.nix { inherit config; inherit lib; inherit pkgs; }).config.packages;
  };
in
{
  imports = [
    {_module.args = {inherit custom;};}
    ../../modules/legacy-nixos/nix.nix
    ../../modules/legacy-nixos/nixos.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series

    
    ../../modules/legacy-nixos/amd.nix
    ../../modules/legacy-nixos/audio.nix
    ../../modules/legacy-nixos/bluetooth.nix
    ../../modules/system/home-manager.nix
    ../../modules/legacy-nixos/kde.nix
    ../../modules/legacy-nixos/sddm.nix
    ../../modules/legacy-nixos/ssh.nix
    ../../modules/legacy-nixos/systemd-boot.nix
    ../../modules/legacy-nixos/touchpad.nix
    ../../modules/legacy-nixos/users.nix
    ../../modules/legacy-nixos/wifi.nix
  ];
}