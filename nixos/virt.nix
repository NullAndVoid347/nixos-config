{
  config,
  pkgs,
  ...
}:
{

  users.users."${config.var.username}".extraGroups = ["docker" "libvirtd"];
  
  environment.systemPackages = with pkgs; [
    distrobox
  ];

  services.flatpak.enable = true;
  
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    podman.enable = true;
  };
  
}
