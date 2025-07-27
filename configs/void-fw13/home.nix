{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../legacy/home/programs/bash
    ../../legacy/home/programs/git
    ../../legacy/home/programs/firefox
    ../../legacy/home/programs/zed
    ../../legacy/home/programs/zen
    ../../legacy/home/programs/git/signing.nix

    # Scripts
    ../../legacy/home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../legacy/home/system/kde

    ./secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # ardour
      # bottles
      # boxbuddy
      chromium
      discord
      ghostty
      # gimp
      # goverlay
      gparted
      # grayjay
      haruna
      # krita
      librewolf
      # mangohud
      obsidian
      # ocrfeeder
      # onlyoffice-bin
      protonmail-desktop
      proton-pass
      protonvpn-gui
      # ptyxis
      # rclone-browser
      # rclone-ui
      stremio
      teams-for-linux
      tidal-hifi
      # via
      # vial
      # virt-manager
      vlc
      # vscode
    ];

    stateVersion = config.var.stateVersion;
  };

  programs.home-manager.enable = true;
}
