# Hyprland is a dynamic tiling Wayland compositor.
{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    blueman
    hyprland-qtutils
  ];

  services.blueman.enable = true;
  
  services = {
    xserver = {
      enable = true;
    };
    gnome.gnome-keyring.enable = true;
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };
  
  services = {
    dbus = {
      implementation = "broker";
      packages = with pkgs; [gcr gnome-settings-daemon];
    };
  };
  
  services.displayManager.sddm.settings.Wayland.SessionDir = "${
    inputs.hyprland.packages."${pkgs.system}".hyprland
  }/share/wayland-sessions";


  
  security = {
    # allow wayland lockers to unlock the screen
    pam.services.hyprlock.text = "auth include login";
  };
  
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
