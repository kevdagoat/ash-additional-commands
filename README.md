# Technicolor ash Shell additional commands.
Adds init.d based systemctl command and /sys/class/leds based ledctl command.

This should work with all openwrt based Technicolor Gateways and most likely all openwrt distros.
systemctl will automatically index all services that exist in the /etc/init.d directory and ledctl will automatically index all services that exist in the /sys/class/leds directory.


## To Install
1. Copy install.sh over to the modems /tmp directory (or wget it.)
2. Run: chmod +x /tmp/install.sh
3. Run: /tmp/install.sh
4. Enjoy!  
