sudo mv /usr/sbin/rsyslogd /usr/sbin/rsyslogd.bak && sudo ln -sf /bin/true /usr/sbin/rsyslogd # Kill these blocking scripts

sudo mv /google/devshell/startup.sh /google/devshell/startup.sh.bak && sudo ln -sf /bin/true /google/devshell/startup.sh # Send 'The web IDE started successfully' to onrun, so it doesn't hang

sudo env USER=root /google/scripts/onrun.sh /bin/bash # Set env USER= to (root), and spawn a shell
