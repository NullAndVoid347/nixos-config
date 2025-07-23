{config, ...}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/ai.nix
    ../../nixos/amd.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/gaming.nix
    ../../nixos/home-manager.nix
    ../../nixos/kde.nix
    ../../nixos/keychron.nix
    ../../nixos/nix.nix
    ../../nixos/sddm.nix
    ../../nixos/ssh.nix
    ../../nixos/system-packages.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/testing.nix
    ../../nixos/touchpad.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/virt.nix
    ../../nixos/wifi.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = config.var.stateVersion;
}
