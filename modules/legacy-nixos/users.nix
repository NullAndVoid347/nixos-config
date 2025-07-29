# Users configuration for NixOS
{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;

    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      # initialPassword = "password";
      extraGroups = [ "wheel"
                      "audio"
                      "input"
                      "networkmanager"
                      "systemd-journal"
                      "video"];
    };
  };
}
