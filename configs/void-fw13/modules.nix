{
  config,
  lib,
  ...
}: 
# let
#   path = "../../modules/";
# in
{
  config.modules = {
    
    home-manager = builtins.concatLists [
      config.modules.legacy-home-programs
      config.modules.legacy-home-scripts
      config.modules.legacy-home-system
      config.modules.legacy-unsorted
    ];
    
    configuration-nix = builtins.concatLists [
      config.modules.legacy-nixos
    ];
    
    apps = [
    ];
    
    hardware = [
    ];
    
    scripts = [
    ];
    
    services = [
    ];
    
    system = [
    ];
    
    themes = [
    ];
    
    legacy-home-programs = [
      ../../modules/legacy-home/programs/bash
      ../../modules/legacy-home/programs/git
      ../../modules/legacy-home/programs/firefox
      ../../modules/legacy-home/programs/zed
      ../../modules/legacy-home/programs/zen
      ../../modules/legacy-home/programs/git/signing.nix
    ];
    
    legacy-home-scripts = [
      ../../modules/legacy-home/scripts
    ];
    
    legacy-home-system = [
      ../../modules/legacy-home/system/kde
    ];
    
    legacy-unsorted = [
      ../../configs/void-fw13/secrets
    ];
    
    legacy-nixos = [
    ];
    
  };

  # Let this here
  options.modules = lib.mkOption { type = lib.types.attrs; default = {
    home-manager = lib.mkOption { type = lib.types.path; default = []; };
    configuration-nix = lib.mkOption { type = lib.types.path; default = []; };
    apps = lib.mkOption { type = lib.types.path; default = []; };
    hardware = lib.mkOption { type = lib.types.path; default = []; };
    scripts = lib.mkOption { type = lib.types.path; default = []; };
    services = lib.mkOption { type = lib.types.path; default = []; };
    system = lib.mkOption { type = lib.types.path; default = []; };
    themes = lib.mkOption { type = lib.types.path; default = []; };
    legacy-home-programs = lib.mkOption { type = lib.types.path; default = []; };
    legacy-home-scripts = lib.mkOption { type = lib.types.path; default = []; };
    legacy-home-system = lib.mkOption { type = lib.types.path; default = []; };
    legacy-unsorted = lib.mkOption { type = lib.types.path; default = []; };
    legacy-nixos = lib.mkOption { type = lib.types.path; default = []; };
  };};

  


}
