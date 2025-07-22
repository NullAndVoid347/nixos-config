{ ... }:
{
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  services.sshd.enable = true;
}
