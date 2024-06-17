{ pkgs, ... }:

{
  # Enable Theme
  environment.variables.GTK_THEME = "Gruvbox-Dark";
  environment.variables.XCURSOR_THEME = "Gruvbox-Dark";
  environment.variables.XCURSOR_SIZE = "20";
  console = {
    earlySetup = true;
    colors = [
      "24273a"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cad3f5"
      "5b6078"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "a5adcb"
    ];
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: { colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["orange"]; };
    # catppuccin-gtk = pkgs.catppuccin-gtk.override {
      # accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes 
      # size = "standard";
      # variant = "macchiato";
    # };
    discord = pkgs.discord.override {
      # withOpenASAR = true;
      # withTTS = true;
    };
  };

  environment.systemPackages = with pkgs; [
    numix-icon-theme-circle
    colloid-icon-theme
    # catppuccin-gtk
    gruvbox-dark-gtk
    catppuccin-kvantum
    catppuccin-cursors.macchiatoTeal

    # gnome.gnome-tweaks
    # gnome.gnome-shell
    # xsettingsd
    # gnome.gnome-shell-extensions
    # themechanger
    # for QT
    libsForQt5.qt5ct
  ];

  # Some fixes for QT to render appropriately (Status)
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
