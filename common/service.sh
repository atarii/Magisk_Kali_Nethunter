#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

log -p i -t userinit "Symlinking Kali boot scripts"
ln -s /data/data/com.offsec.nethunter/files/scripts/bootkali $MODDIR/system/bin/bootkali
ln -s /data/data/com.offsec.nethunter/files/scripts/bootkali_init $MODDIR/system/bin/bootkali_init
ln -s /data/data/com.offsec.nethunter/files/scripts/bootkali_login $MODDIR/system/bin/bootkali_login
ln -s /data/data/com.offsec.nethunter/files/scripts/bootkali_bash $MODDIR/system/bin/bootkali_bash
ln -s /data/data/com.offsec.nethunter/files/scripts/killkali $MODDIR/system/bin/killkali

for i in `find /data/data/com.offsec.nethunter/files/etc/init.d/*`; do
	log -p i -t "Nethunter Boot" "Executing $i"
	su -c $i
done

#!/system/bin/sh
# call userinit.sh and/or userinit.d/* scripts if present in /data/local
if [ -e /data/local/userinit.sh ]; then
	log -p i -t userinit "Executing /data/local/userinit.sh"
	logwrapper /system/bin/sh /data/local/userinit.sh
	#setprop cm.userinit.active 1
fi

if [ -d /data/local/userinit.d ]; then
	logwrapper /system/xbin/busybox_nh run-parts /data/local/userinit.d
	#setprop cm.userinit.active 1
fi
