# Works without rebooting device as well

# Write Function
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

# Optimization 
OPT() {
sleep 1
cmd package bg-dexopt-job
fstrim -v /cache
sleep 0.5
fstrim -v /data
sleep 0.5
fstrim -v /product
sleep 0.5
fstrim -v /system
sleep 0.5
fstrim -v /vendor
sleep 0.4
   }
   
# Amoled Colors 
AMO() {
   write "/sys/module/msm_drm/parameters/kcal_cont" "262"
write "/sys/module/msm_drm/parameters/kcal_hue" "0"
write "/sys/module/msm_drm/parameters/kcal_sat" "272"
write "/sys/module/msm_drm/parameters/kcal_val" "256"
   }

# Smoothness 
SMO() {
write "/dev/stune/top-app/schedtune.boost" "10"
write "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" "schedutil"
write "/sys/devices/system/cpu/cpu6/cpufreq/scaling_governor" "schedutil"
write "/sys/module/cpu_boost/parameters/input_boost_freq" "0:1708800 6:2208800"
write "/sys/module/cpu_boost/parameters/input_boost_ms" "500"
write "/sys/class/kgsl/kgsl-3d0/min_pwrlevel" "4"
write "/proc/sys/kernel/sched_downmigrate" "78"
write "/proc/sys/kernel/sched_upmigrate" "93"
 }

# Network Tweaks
NET() {
write "/proc/sys/net/ipv4/tcp_ecn" "1"
write "/proc/sys/net/ipv4/tcp_fastopen" "8"
write "/proc/sys/net/ipv4/tcp_syncookies" "0"
}
