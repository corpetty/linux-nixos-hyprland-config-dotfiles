{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    # https://www.reddit.com/r/hyprland/comments/17j12jz/finally_got_xwayland_on_nvidia_working_perfectly/
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    # LIBVA_DRIVER_NAME = "nvidia"; 
    # XDG_SESSION_TYPE = "wayland";
    # GBM_BACKEND = "nvidia-drm";
    # GDK_BACKEND = "wayland,x11";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # SDL_VIDOE_DRIVER = "wayland";
    # CLUTTER_BACKEND = "wayland";
    # MOZ_ENABLE_WAYLAND = "1";
    # MOZ_DISABLE_RDD_SANDBOX = "1";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # QT_QPA_PLATFORM = "wayland";
    # __NV_PRIME_RENDER_OFFLOAD = "1";
    # __VK_LAYER_NV_optimus = "NVIDIA_only";
    # PROTON_ENABLE_NGX_UPDATER = "1";
    # NVD_BACKEND = "direct";
    # __GL_GSYNC_ALLOWED = "1";
    # __GL_VRR_ALLOWED = "1";
    # WLR_DRM_NO_ATOMIC = "1";
    # WLR_USE_LIBINPUT = "1";
    # XWAYLAND_NO_GLAMOR = "1"; # with this you'll need to use gamescope for gaming
    # __GL_MaxFramesAllowed = "1";
    # WLR_RENDERER_ALLOW_SOFTWARE = "1";

    # AppImage not seeing fonts, might be causing other issues to
    XDG_CONFIG_HOME = "$HOME/.config";
    # XDG_CACHE_HOME = "$HOME/etc";
    # XDG_DATA_HOME = "$HOME/var/lib";
  };

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

  xdg.mime.defaultApplications = {
    "x-scheme-handler/http" = "wavebox.desktop";
    "x-scheme-handler/https" = "wavebox.desktop";
  };

}
