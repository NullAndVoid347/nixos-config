{
  config,
  lib,
  ...
}: {
  # imports = [
  #   # Choose your theme here:
  #   ../../themes/catppuccin.nix
  # ];

  config.var = {
    hostname = "void-fw13";
    username = "null";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "New_York";
    timeZone = "America/New_York";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "NullAndVoid347";
      email = "70830135+NullAndVoid347@users.noreply.github.com";
    };

    default = {
      editor = "nano";
      terminal = "konsole";
      browser = "zen-beta";
    };

    # env = {
    #   XDG_DATA_HOME = "$HOME/.local/share";
    #   PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    # };

    arch = "x86_64-linux";
    nixos-hardware-model = "framework-amd-ai-300-series";

    autoUpgrade = false;
    autoGarbageCollector = true;
    stateVersion = "25.05";

    # userImports = ("./configs/" + config.var.hostname + "/userImports.nix");
    # pathToFile = "../vimfiles";
    # vimrcConfig.customRC = (builtins.readFile ./${pathToFile}/vimrc.vim)
    # pathToConfigs = ("./configs/" + config.var.hostname);
    # userImports = (./${config.var.pathToConfigs}/userImports.nix);
    #   imports = [./${pathToConfigs}/userImports.nix];
    #   # userImports = config.var.userImports;
    # pathToConfigs = ("../../configs/" + config.var.hostname);
    #
    #
    # userImports = [
    #   # Programs
    #   ./../../legacy/home/programs/bash
    #   ../../legacy/home/programs/git
    #   # ../../legacy/home/programs/firefox
    #   ../../legacy/home/programs/zed
    #   ../../legacy/home/programs/zen
    #   ../../legacy/home/programs/git/signing.nix

    #   # Scripts
    #   # ../../legacy/home/scripts # All scripts

    #   # System (Desktop environment like stuff)
    #   # ../../legacy/home/system/kde

    #   # ../../configs/void-fw13/secrets
    #   ./secrets
    # ];

  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };

}
