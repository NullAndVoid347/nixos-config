{
  config,
  inputs,
  ...
}:
let
  var = config.var;
in
{
  imports = [
    # Mostly system related configuration
    # ../../nixos/ai.nix
    ../../legacy/nixos/amd.nix
    ../../legacy/nixos/audio.nix
    ../../legacy/nixos/bluetooth.nix
    # ../../nixos/fonts.nix
    # ../../nixos/gaming.nix
    ../../legacy/nixos/home-manager.nix
    ../../legacy/nixos/kde.nix
    # ../../nixos/keychron.nix
    ../../legacy/nixos/nix.nix
    ../../legacy/nixos/sddm.nix
    ../../legacy/nixos/ssh.nix
    ../../legacy/nixos/system-packages.nix
    ../../legacy/nixos/systemd-boot.nix
    # ../../nixos/testing.nix
    ../../legacy/nixos/touchpad.nix
    ../../legacy/nixos/users.nix
    ../../legacy/nixos/utils.nix
    # ../../nixos/virt.nix
    ../../legacy/nixos/wifi.nix

    # You should let those lines as is
    ./hardware-configuration.nix


    # inputs.nixos-hardware.nixosModules."${nixos-hardware-model}"
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    inputs.sops-nix.nixosModules.sops
    # inputs.stylix.nixosModules.stylix
  ];

  # Don't touch this
  system.stateVersion = var.stateVersion;
}
