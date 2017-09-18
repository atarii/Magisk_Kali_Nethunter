# Kali Nethunter for Magisk

This module allows you to install the Kali Nethunter chroot systemlessly.

## Instructions:
* Install this Magisk Module
* Run Nethunter app - allow 7(!) Root-related permissions prompts
* Click "Kali Chroot Manager"
* Click "Install Kali Chroot"
* Install the full Kali package
* Reboot
* Load Nethunter and allow initialisation
* Enjoy! Kali Terminal/Nethunter services should now work

## Not Working:
* Wi-Fi injection (requires custom kernel/ramdisk)
* HID Interfaces (BadUSB/Duckhunter etc. - also requires custom kernel/ramdisk)

## Uninstall
* Load "Kali Chroot Manager" and click "Remove Chroot" (Reboot and Remove Chroot)
* Uninstall Kali Nethunter Magisk module (Reboot)
* Manually uninstall Nethunter, Kali Terminal and Kali VNC apps

## Note
Ignore "Failure [DELETE_FAILED_INTERNAL_ERROR]" log line when installing this Magisk Module. Module attempts to uninstall Nethunter APKs before proceeding. This error occurs when they are not already installed.