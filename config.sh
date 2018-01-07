##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  # ui_print "*******************************"
  # ui_print "     Magisk Module Template    "
  # ui_print "*******************************"
  ui_print "##################################################"
  ui_print "##                                              ##"
  ui_print "##  88      a8P         db        88        88  ##"
  ui_print "##  88    .88'         d88b       88        88  ##"
  ui_print "##  88   88'          d8''8b      88        88  ##"
  ui_print "##  88 d88           d8'  '8b     88        88  ##"
  ui_print "##  8888'88.        d8YaaaaY8b    88        88  ##"
  ui_print "##  88P   Y8b      d8''''''''8b   88        88  ##"
  ui_print "##  88     '88.   d8'        '8b  88        88  ##"
  ui_print "##  88       Y8b d8'          '8b 888888888 88  ##"
  ui_print "##                                              ##"
  ui_print "############# Magisk Kali NetHunter #############"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm_recursive  $MODPATH/system/xbin       0       0       0777            0777
  set_perm_recursive  $MODPATH/system/bin       0       0       0777            0777
  set_perm_recursive  $MODPATH/system/etc       0       0       0777            0777
  set_perm_recursive  $MODPATH/system/sbin       0       0       0777            0777
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

install_apks() {
  mkdir $INSTALLER/files
  unzip -o "$ZIP" 'files/*' -d $INSTALLER 2>/dev/null
  if ls /data/data/com.offsec.nethunter* 1> /dev/null 2>&1; then
    ui_print "- Uninstalling Nethunter Application apk"
    pm uninstall com.offsec.nethunter
  fi
  ui_print "- Installing Nethunter Application apk"
  pm install $INSTALLER/files/nethunter.apk
  if ls /data/data/com.offsec.nhterm* 1> /dev/null 2>&1; then
    ui_print "- Uninstalling Nethunter Terminal"
    pm uninstall com.offsec.nhterm
  fi
  ui_print "- Installing Nethunter Terminal apk"
  pm install $INSTALLER/files/Term-nh.apk
  if ls /data/data/com.offsec.nhvnc* 1> /dev/null 2>&1; then
    ui_print "- Uninstalling Nethunter VNC"
    pm uninstall com.offsec.nhvnc
  fi
  ui_print "- Installing Nethunter VNC apk"
  pm install $INSTALLER/files/VNC-nh.apk
}
