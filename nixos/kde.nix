{
  pkgs,
  lib,
  config,
  ...
}: {
  services.xserver.enable = false;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-thunderbolt
    kdePackages.konsole
    # (lib.getBin qttools) # Expose qdbus in PATH
    kdePackages.ark
    kdePackages.elisa
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kate
    kdePackages.khelpcenter
    kdePackages.dolphin
    # baloo-widgets # baloo information in Dolphin
    kdePackages.dolphin-plugins
    kdePackages.spectacle
    kdePackages.ffmpegthumbs
    kdePackages.krdp
    kdePackages.xwaylandvideobridge
    # Since PackageKit Nix support is not there yet,
    # only install discover if flatpak is enabled.
    kdePackages.discover
  ];

  programs.kde-pim.enable = true;
  # programs.ssh.askPassword = with pkgs; mkDefault "${kdePackages.ksshaskpass.out}/bin/ksshaskpass";

  # Enable helpful DBus services.
  services.accounts-daemon.enable = true;

  services.power-profiles-daemon.enable = true;
  services.printing.enable = true;
  services.system-config-printer.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = config.powerManagement.enable;
  services.libinput.enable = true;

  xdg.icons.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    kdePackages.kwallet
    kdePackages.xdg-desktop-portal-kde
    pkgs.xdg-desktop-portal-gtk
  ];
  xdg.portal.configPackages = with pkgs; [ kdePackages.plasma-workspace ];
  services.pipewire.enable = true;

  services.displayManager = {
    sessionPackages = with pkgs; [ kdePackages.plasma-workspace ];
    defaultSession = "plasma";
    sddm = {
      wayland = {
        compositor = "kwin";
      };
      extraPackages = with pkgs; with kdePackages; [
        breeze-icons
        kirigami
        libplasma
        # plasma5support
        qtsvg
        qtvirtualkeyboard
      ];
    };
  };

  security.pam.services = {
    login.kwallet = {
      enable = true;
      package = with pkgs; lib.mkDefault kdePackages.kwallet-pam;
    };
    kde = {
      allowNullPassword = true;
      kwallet = {
        enable = true;
        package = with pkgs; lib.mkDefault kdePackages.kwallet-pam;
      };
    };
    # kde-fingerprint = true;
  };

  services.fprintd.enable = true;
  # services.fprintAuth.enable = true;

  programs.dconf.enable = true;
  programs.kdeconnect.package = with pkgs; lib.mkDefault kdePackages.kdeconnect-kde;
  programs.partition-manager.package = with pkgs; lib.mkDefault kdePackages.partitionmanager;

}
