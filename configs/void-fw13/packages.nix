{
  config,
  lib,
  ...
}: 
{
  config.packages = {
    
    user = builtins.concatLists [
      config.packages.unsorted-user 
      # config.packages.gui
    ];
    
    system = builtins.concatLists [
      config.packages.unsorted-system 
      # config.packages.cli
    ];
    
    cli = [
    ];
    
    gui = [
    ];
    
    dev = [
    ];
    
    browsers = [
    ];
    
    unsorted-user = [
    ];
    
    unsorted-system = [
    ];
    
  };

  # Let this here
  options.packages = lib.mkOption { type = lib.types.attrs; default = {
    user = lib.mkOption { type = lib.types.path; default = []; };
    system = lib.mkOption { type = lib.types.path; default = []; };
    cli = lib.mkOption { type = lib.types.path; default = []; };
    gui = lib.mkOption { type = lib.types.path; default = []; };
    dev = lib.mkOption { type = lib.types.path; default = []; };
    browsers = lib.mkOption { type = lib.types.path; default = []; };
    unsorted-user = lib.mkOption { type = lib.types.path; default = []; };
    unsorted-system = lib.mkOption { type = lib.types.path; default = []; };
  };};
  
}
