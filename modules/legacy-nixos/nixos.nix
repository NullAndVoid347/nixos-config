# Misc
{
  pkgs,
  config,
  ...
}: let
  hostname = config.var.hostname;
  keyboardLayout = config.var.keyboardLayout;
  configDir = config.var.configDirectory;
  timeZone = config.var.timeZone;
  defaultLocale = config.var.defaultLocale;
  extraLocale = config.var.extraLocale;
  autoUpgrade = config.var.autoUpgrade;
  stateVersion = config.var.stateVersion;
  default = config.var.default;
  env = config.var.env;
  packages = config.packages;
in {
  networking.hostName = hostname;

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  system.autoUpgrade = {
    enable = autoUpgrade;
    dates = "04:00";
    flake = "${configDir}";
    flags = ["--update-input" "nixpkgs" "--commit-lock-file"];
    allowReboot = false;
  };
  
  system.stateVersion = stateVersion;
  
  services.fwupd.enable = true;

  time = {timeZone = timeZone;};
  i18n.defaultLocale = defaultLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = extraLocale;
    LC_IDENTIFICATION = extraLocale;
    LC_MEASUREMENT = extraLocale;
    LC_MONETARY = extraLocale;
    LC_NAME = extraLocale;
    LC_NUMERIC = extraLocale;
    LC_PAPER = extraLocale;
    LC_TELEPHONE = extraLocale;
    LC_TIME = extraLocale;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
  };

#   console.keyMap = keyboardLayout;

#   environment.variables = {
#     # XDG_DATA_HOME = env.XDG_DATA_HOME;
#     # PASSWORD_STORE_DIR = env.PASSWORD_STORE_DIR;
#     EDITOR = default.editor;
#     TERMINAL = default.terminal;
#     TERM = default.terminal;
#     BROWSER = default.browser;
#   };

  services.libinput.enable = true;
  # programs.dconf.enable = true;
  # services = {
  #   dbus = {
  #     enable = true;
  #     packages = [ pkgs.dconf ];
  #   };
  #   gvfs.enable = true;
  #   upower.enable = true;
  #   power-profiles-daemon.enable = true;
  #   udisks2.enable = true;
  # };

  # services.printing.enable = true;

  # enable zsh autocompletion for system packages (systemd, etc)
#   environment.pathsToLink = ["/share/zsh"];

  # Faster rebuilding
  # documentation = {
  #   enable = true;
  #   doc.enable = false;
  #   man.enable = true;
  #   dev.enable = false;
  #   info.enable = false;
  #   nixos.enable = false;
  # };

  security = {
    # userland niceness
    rtkit.enable = true;

    # don't ask for password for wheel group
    sudo.wheelNeedsPassword = false;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # services.logind.extraConfig = ''
  #   # don’t shutdown when power button is short-pressed
  #   HandlePowerKey=ignore
  # '';

  services.hardware.bolt.enable = true;
  # services.hardware.openrgb.enable = true;
  environment.systemPackages = packages.system;

}
