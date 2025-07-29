{
  config,
  inputs,
  ...
}:
let
  var = config.var;
  configuration-nix = config.modules.configuration-nix;
  packages = config.packages;
in
{
  imports = [
    # Mostly system related configuration
    # ../../nixos/ai.nix
    ../../modules/legacy-nixos/amd.nix
    ../../modules/legacy-nixos/audio.nix
    ../../modules/legacy-nixos/bluetooth.nix
    # ../../nixos/fonts.nix
    # ../../nixos/gaming.nix
    ../../modules/system/home-manager.nix
    ../../modules/legacy-nixos/kde.nix
    # ../../nixos/keychron.nix
    ../../modules/legacy-nixos/nix.nix
    ../../modules/legacy-nixos/sddm.nix
    ../../modules/legacy-nixos/ssh.nix
    ../../modules/legacy-nixos/systemd-boot.nix
    # ../../nixos/testing.nix
    ../../modules/legacy-nixos/touchpad.nix
    ../../modules/legacy-nixos/users.nix
    ../../modules/legacy-nixos/utils.nix
    # ../../nixos/virt.nix
    ../../modules/legacy-nixos/wifi.nix

    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ];

  environment.systemPackages = packages.system;
  
  # Don't touch this
  system.stateVersion = var.stateVersion;
}
