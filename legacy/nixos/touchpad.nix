{ ... }:
{
  # Enable touchpad support
  services.libinput = {
    touchpad = {
      tapping = true;
      # naturalScrolling = true;
      # scrollMethod = "twofinger";
      # clickfinger_behavior = true;
    };
  };
}
