# Those are my secrets, encrypted with sops
# You shouldn't import this file, unless you edit it
{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];

  inherit (config.var) username;

  sops = {
    age.keyFile = "/home/" + config.var.username + "/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      sshconfig = {path = "/home/" + config.var.username + "/.ssh/config";};
      codeberg-key = {path = "/home/" + config.var.username + "/.ssh/codeberg";};
      codeberg-pub-key = {path = "/home/" + config.var.username + "/.ssh/codeberg.pub";};
      github-key = {path = "/home/" + config.var.username + "/.ssh/github";};
      github-pub-key = {path = "/home/" + config.var.username + "/.ssh/github.pub";};
      signing-key = {path = "/home/" + config.var.username + "/.ssh/signing-key";};
      signing-pub-key = {path = "/home/" + config.var.username + "/.ssh/signing-key.pub";};
    };
  };

  home.file.".config/nixos/.sops.yaml".text = ''
    keys:
      - &primary age103zgk0xkmemc3sshl8t49868rd2rdzymue28sly27g7t9y3h2utqayxtye
      - &fw13 age14u7wqeqcsw23kzp49y2fnlqcstwvzlzq9zns0z39uds0xgq3a3fq3hrw04
    creation_rules:
      - path_regex: hosts/null-fw13/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
            - *fw13
      - path_regex: hosts/null-fw16/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
  '';

  systemd.user.services.mbsync.unitConfig.After = ["sops-nix.service"];
  home.packages = with pkgs; [sops age];

  # wayland.windowManager.hyprland.settings.exec-once = ["systemctl --user start sops-nix"];
}
