{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/bash
    ../../home/programs/git
    ../../home/programs/firefox
    ../../home/programs/zed
    ../../home/programs/zen
    ../../home/programs/git/signing.nix

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/kde

    ./secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      ardour
      bottles
      boxbuddy
      chromium
      discord
      ghostty
      gimp
      goverlay
      gparted
      grayjay
      haruna
      krita
      librewolf
      mangohud
      obsidian
      ocrfeeder
      onlyoffice-bin
      protonmail-desktop
      proton-pass
      protonvpn-gui
      ptyxis
      rclone-browser
      rclone-ui
      stremio
      teams-for-linux
      tidal-hifi
      via
      vial
      virt-manager
      vlc
      vscode
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    # file.".face.icon" = {source = ../../images/Gengar.png;};

    # Don't touch this
    stateVersion = config.var.stateVersion;
  };

  programs.home-manager.enable = true;
}
