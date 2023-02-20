#!/bin/bash 
export iplocal=$(ip route get 1.2.3.4 | awk '{print $7}')
export host=$(hostname)
export os=$(cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f2 | cut -c 1-30)
export cpu=$(cat /proc/cpuinfo | grep "model name" | head -1 | cut -d ":" -f2 | cut -c 1-30)
export ram=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
export processes=$(ps -A | wc -l)
export kernel=$(uname -r)
export uptime=$(uptime -p)

export arch=$(uname -m)
export disk=$(df -h / | awk 'NR==2{print $4}')
export kernel_version=$(uname -v | cut -c 1-30)
#colores
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# formato
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
# Obtener el ancho de la pantalla
cols=$(tput cols)
cols=$((cols+12))




# Salida del sistema con emojis y formato
echo -e " " | cut -c -${cols}
echo -e "  。★  ˚ •    -   ˚ •。★˚˛˚   ${GREEN}${BOLD}        👤 Usuario:${NC} $USER | ${GREEN}${BOLD}💻 Hostname:${NC} $host " | cut -c -${cols}
echo -e "      _______|@|_________  •  ${GREEN}${BOLD}  ${NC}" | cut -c -${cols}
echo -e "     --------------------- ˚  ${GREEN}${BOLD}  🔧 SISTEMA OPERATIVO:${NC} $os" | cut -c -${cols}
echo -e "    ||  POLICE ---- BOX  ||   ${GREEN}${BOLD}  💾 CPU:${NC} $cpu" | cut -c -${cols}
echo -e "    -----------------------C  ${GREEN}${BOLD}  🧠 RAM:${NC} $ram" | cut -c -${cols}
echo -e "    |  ______  |  ______  |É  ${GREEN}${BOLD}  📊 PROCESOS:${NC} $processes" | cut -c -${cols}
echo -e "    |  |####|  |  |####|  |S  ${GREEN}${BOLD}  🖥️ KERNEL:${NC} $kernel ${GREEN}${BOLD} ${NC}"| cut -c -${cols}
echo -e "    |  |####|  |  |####|  |A  ${GREEN}${BOLD}  ⏱️ TIEMPO DE ACTIVIDAD:${NC} $uptime" | cut -c -${cols}
echo -e "    |  |####|  |  |####|  |R  ${GREEN}${BOLD}  📅 FECHA:${NC} $(date +"%d/%m/%Y") ${GREEN}${BOLD}| HORA:${NC} $(date +"%H:%M:%S")" | cut -c -${cols}
echo -e "  % |  ------  |  ------  |˚  ${GREEN}${BOLD}  💾 USO DE CPU:${NC} $(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}')" | cut -c -${cols}
echo -e "    |  |BAD |  |  |    |  |˚  ${GREEN}${BOLD}  💽 USO DE DISCO:${NC} $disk libre de $(df -h / | awk 'NR==2{print $2}') ${NC}" | cut -c -${cols}
echo -e "    |  |WOLF|  |  |    |  |   ${GREEN}${BOLD}   Arquitectura:${NC} $arch ${GREEN}${BOLD}| Versión:${NC} $kernel_version ${NC}" | cut -c -${cols}
echo -e "    |  ------  |O ------  |   ${GREEN}${BOLD} ${NC} " | cut -c -${cols}
echo -e "    |  ------  |° ------  |   ${GREEN}${BOLD} ${NC}" | cut -c -${cols}
echo -e "  ♥ |  |    |  |  |    |  |   ${GREEN}${BOLD} ${NC}" | cut -c -${cols}
echo -e "  L |  |    |  |  |    |  |•˛ " | cut -c -${cols}
echo -e "  A |  ------  |  ------  |。 " | cut -c -${cols}
echo -e "  U |  ------  |  ------  |•  " | cut -c -${cols}
echo -e "  ♥ |  |    |  |  |    |  |˚• " | cut -c -${cols}
echo -e "  ˚ |  |    |  |  |    |  |•˚ " | cut -c -${cols}
echo -e "    |  ------  |  ------  |   " | cut -c -${cols}
echo -e "   _|_____________________|_  " | cut -c -${cols}
echo -e "   |_______________________|  " | cut -c -${cols}
echo -e "  " | cut -c -${cols}

