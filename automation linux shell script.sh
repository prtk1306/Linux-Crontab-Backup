#!
#
# Script:
# backup_crontab_alluser.sh
#
# Description:
# Backup crontab for all users. Script also cleanups backups after 60 days
#


datestamp=`date +"%Y%m%d_%H%M%S"`
crondir="/tmp"
directory="${crondir}/${datestamp}"

# Create directory
if [[ ! -e ${directory} ]]; then
        mkdir ${directory}
        chmod 777 ${directory}
		echo "This directory has been created..."
else
        echo "This directory already exists..."
fi

# Create backup for today
cp /var/spool/cron/* ${directory}; 

if [[ 0 -e ls -lrt ${directory} | wc -l ]]; then
		echo "Crontab backed up successfully..."
else
        echo "Error in taking crontab backup..."
fi

# Cleanup backups older than 60 days
find /tmp/ -mtime +60 -exec rm -rf {} \;