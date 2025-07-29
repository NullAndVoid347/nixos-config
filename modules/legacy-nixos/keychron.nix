{
  # pkgs,
  # config,
  ...
}: {
  # allow hid in chrome - for keychron keyboard and mouse
  boot.initrd.services.udev.rules = ''
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"
  '';
}
