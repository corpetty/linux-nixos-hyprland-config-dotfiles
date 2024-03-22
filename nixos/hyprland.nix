{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  # Some additional env varialbles as defined in https://wiki.hyprland.org/Nvidia/
  environment.sessionVariables.LIBVA_DRIVER_NAME = "nvidia";
  environment.sessionVariables.XDG_SESSION_TYPE = "wayland";
  environment.sessionVariables.GBM_BACKEND = "nvidia-drm";
  environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME = "nvidia";



  environment.systemPackages = with pkgs; [
    wezterm
    alacritty
    cool-retro-term

    starship
    helix

    qutebrowser
    zathura
    mpv
    imv
  ];

}
