# Technicolor ash Shell additional commands.
Adds init.d based systemctl command and /sys/class/leds based ledctl command.

This should work with all openwrt based Technicolor Gateways and most likely all openwrt distros.
systemctl will automatically index all services that exist in the /etc/init.d directory and ledctl will automatically index all services that exist in the /sys/class/leds directory.


## To Install
1. Copy files over to the modems /bin directory
2. Run:

  $ chmod 755 /bin/ledctl
  chmod 755 /bin/systemctl
3. Enjoy!  
