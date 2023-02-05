# Works only when rebooting device

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

# Security Patch Level 
SPL() {
# Will set latest security patch level
   }
   
# Ram Management
RAM() {
# Some Tweaks works without rebooting
write "/sys/block/zram0/disksize" "1894436864"
write "/sys/module/lowmemorykiller/parameters/minfree" "256,10240,32000,34000,36000,38000"
}
