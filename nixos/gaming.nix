{ pkgs, ... }:

{
  # Enable 32bit OpenGL and PulseAudio
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;

  # XBox Pad kernel driver.
  hardware.xone.enable = false;
  hardware.xpadneo.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Packages required for work
  users.users.petty.packages = with pkgs; [
    steam
    steam-run
    gamescope
    mangohud
    lutris
    corefonts
    vulkan-tools
    # Wine
    wineWowPackages.stableFull
    winetricks
  ];

  # enable gamescope for Steam
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        gamescope
        mangohud
      ];
    };
  };
  programs.steam.gamescopeSession.enable = true;
  programs.gamescope.capSysNice = true;
}
