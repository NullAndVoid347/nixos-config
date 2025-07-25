{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
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
}
