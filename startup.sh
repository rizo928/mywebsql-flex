#!/bin/bash

set -e

# check if mywebsql successfully installed
if [ -d /var/www/mywebsql/config ]; then
	echo 'mywebsql installed...'
	if [ -d /config ]; then
		echo 'config directory exists'
		if [ "$(ls -A /config)" ]; then
			cp /config/* /var/www/mywebsql/config
		else
    			echo "/config is Empty"
		fi
		cp /var/www/mywebsql/config/* /config
	else
		echo 'config directory does NOT exist'
	fi
else
	echo 'mywebsql NOT installed...'
fi

if [ -f /etc/configured ]; then
        echo 'we are already configured'
else
      #code that need to run only one time ....
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
