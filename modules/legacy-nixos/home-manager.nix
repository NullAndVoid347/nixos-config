# Home-manager configuration for NixOS
{
  pkgs,
  config,
  inputs,
  ...
}:
let
  var = config.var;
  modules = config.modules;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {inherit inputs var modules;};
    users."${var.username}" = {
      imports = modules.home-manager;

      home = {
        homeDirectory = "/home/" + var.username;
    
        packages = with pkgs; [
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
    
        stateVersion = var.stateVersion;
      };
      programs.home-manager.enable = true;
    };
  };
}
