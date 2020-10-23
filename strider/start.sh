chown -R strider:strider /home/strider

if [[ -n $GENERATE_ADMIN_USER ]]; then
  ADMIN="admin@${FQDN-example.org}"
  PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  strider addUser --email $ADMIN --password $PASSWD --admin true &&
    echo "Admin User: $ADMIN, Admin Pass: $PASSWD"
fi

if [ ! -z "$STRIDER_ADMIN_EMAIL" -a ! -z "$STRIDER_ADMIN_PASSWORD" ]; then
	    echo "$(basename $0) >> Running addUser"
            strider addUser --email $STRIDER_ADMIN_EMAIL --password $STRIDER_ADMIN_PASSWORD --force --admin true
	    echo "$(basename $0) >> Created Admin User: $STRIDER_ADMIN_EMAIL, Password: $STRIDER_ADMIN_PASSWORD"
fi



supervisord -c /etc/supervisor/supervisord.conf
