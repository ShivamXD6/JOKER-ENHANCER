# Variables
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true
SKIPMOUNT=false
DEBUG=false

# Replace list
REPLACE="
"

# Defines
source /$TMPDIR/functions.sh
config=/sdcard/joker.config
Allow=$(READ "Allow" "$config")
ConfigVersion=$(READ "ConfigVersion" "$config")
Optimization=$(READ "Optimization" "$config")
AmoledColors=$(READ "AmoledColors" "$config")
Network=$(READ "Network" "$config")
Smoothness=$(READ "Smoothness" "$config")
SecurityPatch=$(READ "SecurityPatch" "$config")
Ram=$(READ "Ram" "$config")

# Display While Installing Module
ui_print ""
ui_print "          🃏 JOKER ENHANCER ⚡"
ui_print " "
ui_print "          ℹ️ Version = $MODVERSION 🔥"
ui_print " "
ui_print " ⚠️ REMOVE ANY OTHER ENHANCER OR TWEAKER MODULE ⚠️"
sleep 1

# Custom Script For Installation
on_install() {
unzip -o "$ZIPFILE" 'JOKER/apps/*' -d $TMPDIR >&2
unzip -o "$ZIPFILE" 'JOKER/files/*' -d $TMPDIR >&2
unzip -o "$ZIPFILE" 'JOKER/scripts/*' -d $TMPDIR >&2
unzip -o "$ZIPFILE" 'JOKER/tweaks/*' -d $TMPDIR >&2
  unzip -o "$ZIPFILE" 'JOKER/scripts/functions.sh' -d $TMPDIR >&2  
  unzip -o "$ZIPFILE" -x 'META-INF/*' 'JOKER/scripts/functions.sh' 'install.sh' -d $MODPATH >&2
source /$TMPDIR/JOKER/tweaks/NRT.sh
AR=$TMPDIR/service.sh
BR=$TMPDIR/post-fs-data.sh

sleep 1
## Real Installation Begin
if [ -f "$config" ]; then
ui_print ""
ui_print " 🔎 Found JOKER 🃏 Config"

sleep 1
# Abort if Config is OLD
if [ "$ConfigVersion" != "$MODVERSION" ]; then
ui_print ""
ui_print " ❎ Config is Old"
ui_print ""
ui_print "  🃏 Updating Config Version to $MODVERSION"
sed -i "/ConfigVersion/s/.*/ConfigVersion=$MODVERSION/" $TMPDIR/JOKER/files/joker.config
cp -r /$TMPDIR/JOKER/files/joker.config /sdcard/joker.config
ui_print ""
ui_print "   🔴 Edit According to your Needs"
ui_print ""
ui_print "    🔃 Reinstall 🃏 JOKER 🃏 After editing Config "
abort ""
fi

sleep 1
# Abort if Config not Edited or Not Given Permission To Joker 
if [ "$Allow" = "0" ] ; then
ui_print ""
ui_print " ❎ Config is not Edited"
ui_print ""
ui_print "  🃏 Edit Config File located in /sdcard/joker.config OR Internal Storage"
ui_print ""
ui_print "   ✔️ Change Allow=1 in joker.config and edit according to your choices"
ui_print ""
ui_print "    🔃 Reinstall 🃏 JOKER 🃏 After editing Config "
abort ""
fi

sleep 1
## No Reboot Required Tweaks
ui_print ""
ui_print " ☑️ Applying No Reboot Required Tweaks"
ui_print ""
ui_print "  ⚠️ Note :- Reboot is Required For Disabling Tweaks"

sleep 1
 # Optimization 
	if [ "$Optimization" = "1" ] ; then
    ui_print ""
    ui_print "  ✅ OPTIMIZING YOUR DEVICE "
     ui_print ""
     ui_print "   ℹ️ This may take few minutes "
     OPT
        else
     ui_print ""
     ui_print "    ⏩ SKIPPING OPTIMIZATION..."
fi

sleep 1
# Amoled Tweaks 
	if [ "$AmoledColors" = "1" ]; then
    ui_print ""
    ui_print "  ✅ ENABLING AMOLED LIKE COLORS "
    ui_print ""
    ui_print "   ℹ️ Turn on/off night light if doesn't get applied"
    AMO 
    echo "alc" >> $AR;
    echo "alc" >> $BR;
	else 
	ui_print ""
	ui_print "    ⏩ SKIPPING AMOLED LIKE COLORS..."
fi
 
 sleep 1
# Smoothness 
	if [ "$Smoothness" = "1" ] ; then
    ui_print ""
    ui_print "  ✅ ENHANCING SMOOTHNESS"
     ui_print ""
     ui_print "   ℹ️ Recommended for A12 - A13 Specially "
        SMO
    echo "smt" >> $AR;
    echo "smt" >> $BR;
else
     ui_print ""
     ui_print "    ⏩ SKIPPING OPTIMIZATION..."
fi

sleep 1
# Network Tweaks For JIO Unlimited 
	if [ "$Network" = "1" ] ; then
    ui_print ""
    ui_print "  ✅ TWEAKING NETWORK FOR JIO UNLIMITED"
     ui_print ""
     ui_print "   ⏺️ Turn on/off airplane mode if doesn't work "
     NET
    echo "nt" >> $AR;
    echo "nt" >> $BR;
        else
     ui_print ""
     ui_print "    ⏩ SKIPPING NETWORK TWEAK ENHANCEMENT..."
fi

sleep 1
## Reboot Required Tweaks
ui_print ""
ui_print " ☑️ Applying Reboot Required Tweaks"

sleep 1
# Latest Security Patch Level
	if [ "$SecurityPatch" = "1" ] ; then
    ui_print ""
    ui_print "  ✅ UPDATING SECURITY PATCH"
    SPL
     ui_print ""
     ui_print "   ⚠️ May Break Safety Net"
        else
     ui_print ""
     ui_print "    ⏩ SKIPPING SECURITY PATCH ENHANCEMENT..."
fi

sleep 1
# RAM
	if [ "$Ram" = "1" ] ; then
    ui_print ""
    ui_print "  ✅ ENHANCING RAM MANAGEMENT"
    RAME
     ui_print ""
     ui_print "   ℹ️ It Will change RAM behaviour to less killing apps"
     echo "ram" >> $AR;
     echo "ram" >> $BR;
     sed -i "/ro.build.version.security_patch/s/.*/ro.build.version.security_patch=2023-02-05/" $TMPDIR/system.prop
sed -i "/ro.vendor.build.security_patch/s/.*/ro.vendor.build.security_patch=2023-02-05/" $TMPDIR/system.prop
        else
     ui_print ""
     ui_print "    ⏩ SKIPPING RAM MANAGEMENT ENHANCEMENT..."
fi

ui_print ""
ui_print "           ✅ INSTALLATION DONE ✅"
ui_print ""
ui_print "           🃏 FEEL THE JOKER'S SUPREMACY 🃏"
ui_print ""

sleep 1
# Abort If Config Not Found
else 
ui_print ""
ui_print " ❎ No Joker Config Found"
ui_print ""
ui_print "  🃏 Making One Default Config in /sdcard/joker.config"
cp -r /$TMPDIR/JOKER/files/joker.config /sdcard/joker.config
ui_print ""
ui_print "   🔴 Edit According to your Needs then comeback"
ui_print ""
ui_print "    🔃 Reinstall 🃏 JOKER 🃏 After editing config "
abort ""
fi
}

# Set Necessary Permissions
set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
 set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
   set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
   set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}
