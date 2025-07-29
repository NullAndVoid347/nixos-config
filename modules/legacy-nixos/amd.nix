{
  pkgs,
  # config,
  ...
}: {
  
  boot = {
    kernelModules = [ "amdgpu" "kvm-amd" ];
    initrd.kernelModules = [ "amdgpu"];
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    firmware = [ pkgs.linux-firmware ];
    framework.enableKmod = true;
    amdgpu.opencl.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
      ];
    };
  };

  nixpkgs.config.rocmSupport = true;

  environment.systemPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  
  services.xserver.videoDrivers = ["amdgpu"];
  
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  
  # Might help with egpu setup
  # run to get bus IDs for gpus for offload config: nix shell nixpkgs#pciutils -c lspci | grep Radeon
  # hardware.nvidia.prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true; # Lets you use `nvidia-offload %command%` in steam
  #     };

  #     intelBusId = "PCI:c1:00.0";
  #     amdgpuBusId = "PCI:05:00.0";
  # };
}
