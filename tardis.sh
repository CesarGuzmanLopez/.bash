#!/bin/bash 

export iplocal=$(ip route get 1.2.3.4 | awk '{print $7}')
echo "。★  ˚ •    -   ˚ •。★˚˛˚                "$USER"@"$HOSTNAME
echo "    _______|@|_________  •  ====================================="
echo "   --------------------- ˚  || Hostname: "$HOSTNAME"  "
echo "  ||  POLICE ---- BOX  ||   || User" $USER 
echo "  -----------------------C  || IP local: " $iplocal
echo "  |  ______  |  ______  |É  || IP public: " $(curl -s http://ipecho.net/plain)
echo "  |  |####|  |  |####|  |S  || CPU: " $(cat /proc/cpuinfo | grep "model name" | head -1 | cut -d ":" -f2)   
echo "  |  |####|  |  |####|  |A  || RAM: " $(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
echo "  |  |####|  |  |####|  |R  || Processes: " $(ps -A | wc -l)
echo "% |  ------  |  ------  |˚  || OS VERSION: " $(cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f2)
echo "  |  |BAD |  |  |    |  |˚  || Date: " $(date)
echo "  |  |WOLF|  |  |    |  |   || Kernel: " $(uname -r)
echo "  |  ------  |O ------  |   || Time: " $(date +"%H:%M:%S")
echo "  |  ------  |° ------  |   || CPU USAGE: " $(top -bn1 | grep load | awk '{printf "%.2f%%\t\t", $(NF-2)}')
echo "˚ |  |    |  |  |    |  |   || Disk usage: " $(df -h | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}')
echo "L |  |    |  |  |    |  |•˛ || Uptime: $(uptime -p)"
echo "A |  ------  |  ------  |。 || "
echo "U |  ------  |  ------  |•  || "
echo "  |  |    |  |  |    |  |˚• || "
echo "˚ |  |    |  |  |    |  |•˚ || "
echo "  |  ------  |  ------  |   || "
echo " _|_____________________|_  || "
echo " |_______________________|  ||"
