#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'we are already configured'
else
      #code that need to run only one time ....

	# check if mywebsql successfully installed
	if [ -f /var/www/mywebsql/config/servers.php ]; then
		echo 'mywebsql installed...'
	else
		echo 'mywebsql NOT installed...'
	fi
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
