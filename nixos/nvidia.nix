{pkgs, ...}:

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
     # intel-media-driver # LIBVA_DRIVER_NAME=iHD
     # vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      # VA-API
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
    ];
  };
  services.xserver.videoDrivers = [ "nvidiaBeta" ];
  hardware.nvidia = {
    package =  pkgs.linuxKernel.packages.linux_zen.nvidia_x11_production;
    modesetting.enable = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
    open = false;
    powerManagement.enable = true;
  };
  environment.systemPackages = with pkgs; [ 
    nvidia-docker
    # testing for chromium fixes (lag)
    # egl-wayland
    nvidia-vaapi-driver
  ];

  # https://discourse.nixos.org/t/electron-apps-dont-open-on-nvidia-desktops/32505/4
  environment.variables.VDPAU_DRIVER = "va_gl";
  environment.variables.LIBVA_DRIVER_NAME = "nvidia";
    
}
