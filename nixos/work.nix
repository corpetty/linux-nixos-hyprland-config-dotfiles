{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo-lambda
    gnumake
  ];
}
