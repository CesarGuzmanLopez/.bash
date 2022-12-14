#!/bin/bash 

export ipv6addr=$(ip addr show dev "$iface" | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d' | grep -v '^fd00' | grep -v '^fe80' | head -1)
export iplocal=$(ip route get 1.2.3.4 | awk '{print $7}')
echo "。★  ˚ •    -   ˚ •。★˚˛˚  "
echo "    _______|@|_________  •  || Uptime: $(uptime -p)"
echo "   --------------------- ˚  || HOSTNAME: " $HOSTNAME
echo "  ||  POLICE ---- BOX  ||   || USER: " $USER
echo "  -----------------------C  || IP local: " $iplocal
echo "  |  ______  |  ______  |É  || "
echo "  |  |####|  |  |####|  |S  || CPU: " $(cat /proc/cpuinfo | grep "model name" | head -1 | cut -d ":" -f2)   
echo "  |  |####|  |  |####|  |A  || RAM: " $(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
echo "  |  |####|  |  |####|  |R  || processes: " $(ps -A | wc -l)
echo "% |  ------  |  ------  |˚  || OS VERSION: " $(cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f2)
echo "  |  |BAD |  |  |    |  |˚  || Resolutions: " $(xrandr | grep " connected" | cut -d " " -f3)
echo "  |  |WOLF|  |  |    |  |   || Kernel: " $(uname -r)
echo "  |  ------  |O ------  |   || time: " $(date +"%H:%M:%S")
echo "  |  ------  |° ------  |   || CPU USAGE: " $(top -bn1 | grep load | awk '{printf "%.2f%%\t\t", $(NF-2)}')
echo "˚ |  |    |  |  |    |  |   || disk usage: " $(df -h | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}')
echo "L |  |    |  |  |    |  |•˛ || "
echo "A |  ------  |  ------  |。 || current users: " $(users | wc -w)
echo "U |  ------  |  ------  |• "
echo "  |  |    |  |  |    |  |˚•"
echo "˚ |  |    |  |  |    |  |•˚"
echo "  |  ------  |  ------  |  "
echo " _|_____________________|_ "
echo " |_______________________| "
