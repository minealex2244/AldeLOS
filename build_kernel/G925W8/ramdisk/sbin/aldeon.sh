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

# Fix permissions

chmod 0666 /sys/devices/14ac0000.mali/dvfs_governor
chmod 0666 /sys/module/workqueue/parameters/power_efficient

# Set stock clock values

echo 400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo 400000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq

echo 1500000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1500000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo 1500000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo 1500000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo 2100000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 2100000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo 2100000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo 2100000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq

echo 1 > /sys/devices/14ac0000.mali/dvfs_governor
echo 266 > /sys/devices/platform/gpusysfs/gpu_min_clock
echo 700 > /sys/devices/platform/gpusysfs/gpu_max_clock

# Synapse

chmod -R 755 /res/*;

# Create uci link if not present

if [ ! -e /system/bin/uci ]; then
     ln -s ../../res/synapse/uci /system/bin/uci
fi

