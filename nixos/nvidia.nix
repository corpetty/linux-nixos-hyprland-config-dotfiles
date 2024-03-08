{pkgs, ...}:

{
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package =  pkgs.linuxKernel.packages.linux_lqx.nvidia_x11;
    modesetting.enable = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
  };
  environment.systemPackages = with pkgs; [ nvidia-docker ];
    
}
