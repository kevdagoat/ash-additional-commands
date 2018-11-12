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




  
        
 
  
