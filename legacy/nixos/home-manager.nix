# Home-manager configuration for NixOS
{
  pkgs,
  config,
  inputs,
  ...
}:
let
  var = config.var;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {inherit inputs var;};
    users."${var.username}" = {
      
      # imports = userImports;
      imports = [
        # Programs
        ../../legacy/home/programs/bash
        ../../legacy/home/programs/git
        ../../legacy/home/programs/firefox
        ../../legacy/home/programs/zed
        ../../legacy/home/programs/zen
        ../../legacy/home/programs/git/signing.nix
        
        # Scripts
        ../../legacy/home/scripts # All scripts
        
        # System (Desktop environment like stuff)
        ../../legacy/home/system/kde
        ../../configs/void-fw13/secrets
      ]; 
      
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
