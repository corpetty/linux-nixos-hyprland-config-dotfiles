{ pkgs, ... }:

{
  # USB Automounting
  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  services.usbguard = {
    enable = false;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    rules = ''
      allow id 1d6b:0002 # 2.0 usb hub
      allow id 1d6b:0003 # 3.0 usb hub
      allow id 072f:b100 # Advanced card systems
      allow id 1462:7d31 # mystic light
      allow id 0db0:1feb # Micro Start USB audio
      allow id 05e3:0608 # USB hub
      allow id 19f7:0003 # RODE NT-USB
      allow id 1050:0407 # Yubikey
      allow id 2f0e:0101 # MSI STREAK keyboard
      allow id 8087:0032 # AX210 Bluetooth
      allow id 046d:c08b # G502 SE HERO Mouse
      allow id 046d:085e # BRIO Webcam
      allow id 1058:0748 # WD Passport HD
    '';
  };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
