{ pkgs, ... }:

{
  # for camera settings
  environment.systemPackages = with pkgs; [
    v4l-utils
  ];
  
}
