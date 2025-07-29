{
  config,
  lib,
  pkgs,
  ...
}: 
{
  config.packages = {
    
    user = builtins.concatLists [
      config.packages.unsorted-user 
      # config.packages.gui
    ];
    
    system = builtins.concatLists [
      config.packages.unsorted-system 
      # config.packages.cli
    ];
    
    cli = [
    ];
    
    gui = [
    ];
    
    dev = [
    ];
    
    browsers = [
    ];
    
    unsorted-user = with pkgs; [
      # ardour
      # bottles
      # boxbuddy
      chromium
      discord
      # ghostty
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
    
    unsorted-system = with pkgs; [
      # acpi
      # android-tools
      # autoconf
      # automake
      # bc
      # binutils
      # btop
      # cacert
      # coreutils
      # cryptsetup
      curl
      # dconf
      # direnv
      # dmidecode
      # docker
      # docker-compose
      # fastfetch
      # fd
      # file
      fzf
      # gcc
      git
      git-ignore
      # glib
      # gnumake
      gnupg
      # htop
      # inxi
      # iputils
      # iw
      # jq
      # just
      # killall
      # libtool
      # lm_sensors
      nano
      # neofetch
      nil
      nixd
      nix-output-monitor
      # nodejs
      # p7zip
      # pavucontrol
      # pciutils
      # pfetch
      # podman
      # python3
      # qemu
      # rclone
      # rsync
      # sshfs
      # unrar
      # unzip
      # usbutils
      # wayland-protocols
      # wayland-utils
      wget
      # which
      # xdg-utils
      # xz
      # zip
    ];
    
  };

  # Let this here
  options.packages = lib.mkOption { type = lib.types.attrs; default = {
    user = lib.mkOption { type = lib.types.path; default = []; };
    system = lib.mkOption { type = lib.types.path; default = []; };
    cli = lib.mkOption { type = lib.types.path; default = []; };
    gui = lib.mkOption { type = lib.types.path; default = []; };
    dev = lib.mkOption { type = lib.types.path; default = []; };
    browsers = lib.mkOption { type = lib.types.path; default = []; };
    unsorted-user = lib.mkOption { type = lib.types.path; default = []; };
    unsorted-system = lib.mkOption { type = lib.types.path; default = []; };
  };};
  
}
