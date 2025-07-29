# Bluetooth configuration for NixOS
{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = { General = { Experimental = true; }; };
  };
}
