{
  description = "XNM's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      rust-overlay.url = "github:oxalica/rust-overlay";
      stable.url = "nixpkgs/nixos-23.11";
  };

  outputs = { nixpkgs, stable, ... }:
    let
      overlay = final: prev: let
        stablePkgs = import stable { inherit (prev) system; config.allowUnfree = true; };
      in {
        stable = stablePkgs;
      };
      # Overlays-module makes "pkgs.stable" available in configuration.nix
      overlayModule = ({ config, pkgs, ... }: {nixpkgs.overlays = [ overlay ]; });
    in 
  {
    nixosConfigurations.bean = nixpkgs.lib.nixosSystem {
      specialArgs.channels = { inherit nixpkgs stable; }; 
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        # ./fingerprint-scanner.nix
        ./yubikey.nix
        ./keycard.nix
        ./camera.nix
        ./sound.nix
        ./usb.nix
        ./time.nix
        ./swap.nix
        ./bootloader.nix
        ./nix-settings.nix
        ./nixpkgs.nix
        ./gc.nix
        ./auto-upgrade.nix
        ./linux-kernel.nix
        ./screen.nix
        ./nvidia.nix
        ./display-manager.nix
        ./theme.nix
        ./internationalisation.nix
        ./fonts.nix
        ./security-services.nix
        ./services.nix
        # ./printing.nix
        # ./gnome.nix
        ./hyprland.nix
        ./environment-variables.nix
        ./bluetooth.nix
        ./networking.nix
        # ./mac-randomize.nix
        # ./open-ssh.nix
        ./firewall.nix
        ./dns.nix
        # ./vpn.nix
        ./users.nix
        ./virtualisation.nix
        ./programming-languages.nix
        ./lsp.nix
        # ./rust.nix
        ./wasm.nix
        ./info-fetchers.nix
        ./utils.nix
        ./terminal-utils.nix
        ./work.nix
        ./gaming.nix
      ];
    };
  };
}
