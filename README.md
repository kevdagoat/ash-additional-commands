# Technicolor ash Shell additional commands.
Adds init.d based systemctl command and /sys/class/leds based ledctl command.

This should work with all openwrt based Technicolor Gateways and most likely all openwrt distros.
systemctl will automatically index all services that exist in the /etc/init.d directory and ledctl will automatically index all services that exist in the /sys/class/leds directory.


## To Install
Run on Gateway command line:

$ wget -P /tmp https://github.com/kevdagoat/ash-additional-commands/raw/master/install.sh

If webget is not working for you, manually copy it over to the modem's /tmp directory using something like WinSCP.

$ chmod 755 /tmp/install.sh

$ /tmp/install.sh

