{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
  ];

  fonts.fontDir.enable = true;

  # fonts = {
    # fontconfig = {
      # fixes pixelation
      # antialias = true;

      # fixes antialiasing blur
      # hinting = {
        # enable = true;
        # style = "full"; # no difference
        # autohint = true; # no difference
      # };

      # subpixel = {
        # Makes it bolder
        # rgba = "rgb";
        # lcdfilter = "default"; # no difference
      # };
    # };
  # };
}
