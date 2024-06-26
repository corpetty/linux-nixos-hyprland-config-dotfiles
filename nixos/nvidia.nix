{pkgs, config, libs, ...}:

{
  hardware.opengl= {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
   extraPackages = with pkgs; [
      # trying to fix `WLR_RENDERER=vulkan sway`
      # vulkan-validation-layers
      # https://nixos.wiki/wiki/Accelerated_Video_Playback
# removed as it looks like it conflicts with https://wiki.hyprland.org/Nvidia/      
     intel-media-driver # LIBVA_DRIVER_NAME=iHD
     # vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
     intel-compute-runtime
      # VA-API
     vaapiVdpau
     libvdpau-va-gl
#      nvidia-vaapi-driver
   ];
  };
   # services.xserver.videoDrivers = [ "nvidia" ];
   services.xserver.videoDrivers = [ "modesetting" ];
  hardware.nvidia = {
    # package =  pkgs.linuxKernel.packages.linux_zen.nvidia_x11_production;
  # Special config to load the latest (535 or 550) driver for the support of the 4070 SUPER
  package = let 
    rcu_patch = pkgs.fetchpatch {
    url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
    hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
  };
  in config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "535.154.05";
    sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
    sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
    openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
    settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
    persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";

    #version = "550.40.07";
    #sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
    #sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
    #openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
    #settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
    #persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";

    patches = [ rcu_patch ];
  };
    modesetting.enable = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
    open = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };
  environment.systemPackages = with pkgs; [ 
    nvidia-docker
    # testing for chromium fixes (lag)
    # egl-wayland
    # nvidia-vaapi-driver
  ];

  # https://discourse.nixos.org/t/electron-apps-dont-open-on-nvidia-desktops/32505/4
  # environment.variables.VDPAU_DRIVER = "va_gl";
  # environment.variables.LIBVA_DRIVER_NAME = "nvidia";
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
    
}
