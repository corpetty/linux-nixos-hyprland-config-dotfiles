{pkgs, ...}:

{
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = pkgs.linuxKernel.packages.linux_6_1.nvidia_x11;
  hardware.nvidia.modesetting.enable = true;
  environment.systemPackages = with pkgs; [ nvidia-docker ];
}
