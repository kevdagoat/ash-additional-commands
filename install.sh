#!/bin/sh
touch /bin/ledctl
touch /bin/systemctl

cat > /bin/ledctl <<EOF
#!/bin/sh

leds=$(ls /sys/class/leds) # Find avaliable leds

################################################

if [ "$1" = -l ]; then                     #Check for list command.
echo $leds   
exit 1   
fi

################################################

if [ -z $1 ]; then                                                             #Check if user inputted any led data.
echo "Please select LED. To see all avaliable LEDs run: ledctl -l"
exit 1
fi

################################################

if [ -z $2 ]; then                        #Check if state exists
   echo "Please choose state: on or off."
exit 1
fi
    
################################################

if [ -e /sys/class/leds/$1 ]; then       #Check if spcified led exists.
 echo 'Led exists.'

      if [ "$2" == 'on' ] && [ -e /sys/class/leds/$1 ]; then    #Check if args are valid and write data
        ledstate=1
        echo $ledstate >/sys/class/leds/$1/brightness
        echo "Set "$1" state to "$2"."

      elif [ "$2" == 'off' ] && [ -e /sys/class/leds/$1 ]; then  #Check if args are valid and write data
        ledstate=0
        echo $ledstate >/sys/class/leds/$1/brightness
        echo "Set "$1" state to "$2"."
      else 
        echo "Please choose state: on or off."
        exit 1
      fi

else
 echo 'Led selection is invalid. Run ledcontrol -l to see avaliable leds.' 
 exit 1
fi
################################################
EOF

cat > /bin/systemctl <<EOF
#!/bin/sh

processes=$(ls /etc/init.d/) # Find avaliable services

################################################

if [ -z "$0" ]; then                     #Check for list command.
echo "This command line utility is for the easy management of Services using init.d paths."   
exit 1   
fi

################################################

if [ "$1" = -l ]; then                     #Check for list command.
echo $processes   
exit 1   
fi


################################################

if [ -z $1 ]; then                                                             #Check if user inputted any service data.
echo "Please select a Service. To see all avaliable Services run: systemctl -l"
exit 1
fi

################################################

if [ -z $2 ]; then                        #Check if state exists
   /etc/init.d/$1
exit 1
fi
    
################################################

if [ -e /etc/init.d/$1 ]; then       #Check if spcified serviceserctl stop led exists.
 echo "Service exists."

if [ "$2" == 'stop' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Stopped"

elif [ "$2" == 'start' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Started"

elif [ "$2" == 'disable' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Disabled"


elif [ "$2" == 'enable' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Enabled"


elif [ "$2" == 'restart' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Restarted"


elif [ "$2" == 'reload' ] && [ -e /etc/init.d/$1 ]; then    #Check if args are valid and write data
        
        /etc/init.d/$1 $2
        echo "Service "$1" Reloaded"

else 
/etc/init.d/$1
exit 1
fi

else
 echo "Service does not exist. Run systemctl -l to see avaliable services." 
 exit 1
fi
################################################


EOF
chmod 755 /bin/systemctl
chmod 755 /bin/ledctl
echo "Install finished. To use commands run systemctl/ledctl -h"
