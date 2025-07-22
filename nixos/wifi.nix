{lib, ...}: {
  # Network configuration
  networking = {
    networkmanager = {
      wifi.powersave = lib.mkDefault false;
    };
  };
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
      # IPv6 = {
      #   Enabled = true;
      # };
      Settings = {
        AutoConnect = true;
      };
    };
  networking.networkmanager.wifi.backend = "iwd";
}
