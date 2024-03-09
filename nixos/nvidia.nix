{pkgs, ...}:

{
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package =  pkgs.linuxKernel.packages.linux_zen.nvidia_x11i_vulkan_beta;
    modesetting.enable = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
    open = false;
  };
  environment.systemPackages = with pkgs; [ nvidia-docker ];
    
}
