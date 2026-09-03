# rCat (rBash reference, LOL) - Local Privilege Escalation via Argument/Flag Injection

# Spawn a server
docker rm -f local_target 2>/dev/null
docker run -d --name local_target php:8.2-apache
sleep 2

# Get sudo (you need it) and fix PAM
docker exec -u root local_target sh -c 'apt-get update && apt-get install -y sudo'
docker exec -u root local_target sed -i 's/^auth\s\+required\s\+pam_securetty.so/# auth required pam_securetty.so/' /etc/pam.d/login

# Set the custom (root) prompt, as the normal ones suck
docker exec -u root local_target sh -c 'echo "export PS1=\"root@apache: # \"" >> /root/.bashrc'

# Close the file, put shell args (don't do that in real stuff)
docker exec -u root local_target sh -c 'cat << "EOF" > /usr/local/bin/in.rshd
INPUT_ARGS=$1
exec /usr/bin/login $INPUT_ARGS
EOF
chmod +x /usr/local/bin/in.rshd

# Create the rule, to run the in.rshd daemon as (root)
echo "www-data ALL=(root) NOPASSWD: /usr/local/bin/in.rshd" | docker exec -i local_target sh -c 'cat >> /etc/sudoers'




