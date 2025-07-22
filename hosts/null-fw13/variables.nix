{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "null-fw13";
    username = "null";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "en";

    location = "New_York";
    timeZone = "America/New_York";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "NullAndVoid347";
      email = "github.com.urgency150@passmail.net";
    };

    default = {
      editor = "nano";
      terminal = "konsole";
      browser = "zen-beta";
    };

    env = {
      XDG_DATA_HOME = "$HOME/.local/share";
      PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
    stateVersion = "25.05";
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
