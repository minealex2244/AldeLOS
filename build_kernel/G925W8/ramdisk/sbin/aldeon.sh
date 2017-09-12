#!/system/bin/sh

# Check the location of BusyBox

if [ ! -f /su/xbin/busybox ]; then
	BB=/system/xbin/busybox;
else
	BB=/su/xbin/busybox;
fi;

# KNOX warranty status
sh /sbin/resetprop.sh > /dev/null;

# Mount rootfs and system as RW

mount -o rw,remount rootfs;
mount -o rw,remount /system;

# Fix permissions

chmod 0666 /sys/devices/system/cpu/cpu4/cpufreq/interactive/param_index
chmod 0666 /sys/devices/system/cpu/cpu4/cpufreq/interactive/cpu_util
chmod 0666 /sys/devices/system/cpu/cpu0/cpufreq/interactive/cpu_util
chmod 0666 /sys/devices/14ac0000.mali/dvfs_governor

# Synapse

chmod -R 755 /res/*;

# Create uci link if not present

if [ ! -e /system/bin/uci ]; then
     ln -s ../../res/synapse/uci /system/bin/uci
fi

