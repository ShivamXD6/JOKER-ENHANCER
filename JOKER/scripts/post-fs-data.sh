# Module Path 
MODDIR=${0%/*}

# Write function to avoid any error
write() {

 [[ ! -f "$1" ]] && return 1

 chmod +w "$1" 2> /dev/null

 if ! echo "$2" > "$1"   2> /dev/null
 then
  echo "Failed: $1 → $2" > /dev/null 2>&1
  return 1
 fi

 echo " SUCCESS $1 → $2" > /dev/null 2>&1
}

# Feel The Smoothness
smt() {
write "/dev/stune/top-app/schedtune.boost" "10"
write "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" "schedutil"
write "/sys/devices/system/cpu/cpu6/cpufreq/scaling_governor" "schedutil"
write "/sys/module/cpu_boost/parameters/input_boost_freq" "0:1708800 6:2208800"
write "/sys/module/cpu_boost/parameters/input_boost_ms" "500"
write "/sys/class/kgsl/kgsl-3d0/min_pwrlevel" "4"
write "/proc/sys/kernel/sched_downmigrate" "78"
write "/proc/sys/kernel/sched_upmigrate" "93"
 }

# Amoled Like Colors
alc() {
write "/sys/module/msm_drm/parameters/kcal_cont" "262"
write "/sys/module/msm_drm/parameters/kcal_hue" "0"
write "/sys/module/msm_drm/parameters/kcal_sat" "272"
write "/sys/module/msm_drm/parameters/kcal_val" "256"
    }

# Improve Ram Management   
ram() {
write "/sys/block/zram0/reset" "1"
write "/sys/block/zram0/disksize" "1894436864"
write "/sys/block/zram0/max_comp_streams" "8"
write "/proc/sys/vm/swappiness" "100"
write "/proc/sys/vm/dirty_background_ratio" "15"
write "/proc/sys/vm/vfs_cache_pressure" "200"
write "/proc/sys/vm/dirty_writeback_centisecs" "3000"
write "/proc/sys/vm/drop_caches" "3"
write "/proc/sys/vm/oom_kill_allocating_task" "0"
write "/sys/module/lowmemorykiller/parameters/minfree" "256,10240,32000,34000,36000,38000"
}

# Network Tweaks
nt() {
write "/proc/sys/net/ipv4/tcp_ecn" "1"
write "/proc/sys/net/ipv4/tcp_fastopen" "8"
write "/proc/sys/net/ipv4/tcp_syncookies" "0"
}

# Applied Tweaks
