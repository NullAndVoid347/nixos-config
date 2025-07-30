{
  lib,
  ...
}: 
# let
#   path = "../../modules/";
# in
{
  config.modules = {
    
    home-manager = [
      ../../modules/legacy-home/programs/bash
      ../../modules/legacy-home/programs/git
      # ../../modules/legacy-home/programs/firefox
      ../../modules/legacy-home/programs/zed
      ../../modules/legacy-home/programs/zen
      ../../modules/legacy-home/programs/git/signing.nix
      ../../modules/legacy-home/scripts
      ../../modules/legacy-home/system/kde
      ../../configs/void-fw13/secrets
    ];
    
    configuration-nix = [
      # Mostly system related configuration

      ../../modules/legacy-home/programs/firefox
      ../../modules/legacy-home/programs/ladybird
    ];
    
    # apps = [
    # ];
    
    # hardware = [
    # ];
    
    # scripts = [
    # ];
    
    # services = [
    # ];
    
    # system = [
    # ];
    
    # themes = [
    #   # inputs.stylix.nixosModules.stylix
    # ];
    
    # legacy-home-programs = [
    #   ../../modules/legacy-home/programs/bash
    #   ../../modules/legacy-home/programs/git
    #   # ../../modules/legacy-home/programs/firefox
    #   ../../modules/legacy-home/programs/zed
    #   ../../modules/legacy-home/programs/zen
    #   ../../modules/legacy-home/programs/git/signing.nix
    # ];
    
    # legacy-home-scripts = [
    #   ../../modules/legacy-home/scripts
    # ];
    
    # legacy-home-system = [
    #   ../../modules/legacy-home/system/kde
    # ];
    
    # legacy-unsorted = [
    #   ../../configs/void-fw13/secrets
    # ];
    
    # legacy-nixos = [
    #   ../../modules/legacy-home/programs/firefox
    # ];
    
  };

  # Let this here
  options.modules = lib.mkOption {
    type = lib.types.attrs;
    default = {
      configuration-nix = lib.mkOption {
        type = lib.types.listOf;
        default = [];
      };
    };
  };

}
