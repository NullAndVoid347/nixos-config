{config, inputs, ...}: {
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
    ./variables.nix

    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    inputs.home-manager.nixosModules.home-manager
    # inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = config.var.stateVersion;
}
