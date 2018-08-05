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
echo "Please select a Service. To see all avaliable Services run: serctl -l"
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
 echo "Service does not exist. Run serctl -l to see avaliable services." 
 exit 1
fi
################################################

