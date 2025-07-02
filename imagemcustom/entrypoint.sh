#!/bin/sh

mkdir -p /www

echo "===== Container Info Dump =====" > /www/index.txt
echo "Hostname: $(hostname)" >> /www/index.txt
echo "IP Address: $(hostname -i)" >> /www/index.txt
echo "OS: $(grep PRETTY_NAME /etc/os-release)" >> /www/index.txt
echo "Kernel: $(uname -r)" >> /www/index.txt
echo "User: $(whoami) (UID: $(id -u), GID: $(id -g))" >> /www/index.txt
echo "\n--- Environment Variables ---" >> /www/index.txt
env >> /www/index.txt
echo "\n--- Memory Info ---" >> /www/index.txt
cat /proc/meminfo >> /www/index.txt
echo "\n--- Disk Usage ---" >> /www/index.txt
df -h >> /www/index.txt
echo "\n--- Network Interfaces ---" >> /www/index.txt
ip addr >> /www/index.txt

python3 -m http.server 8080 --directory /www

