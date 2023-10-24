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
export ram_total=$(free -m | awk 'NR==2{print $2}')
export ram_used=$(free -m | awk 'NR==2{print $3}')
export tarjetaGrafica=$(lspci | grep VGA | head -1 | cut -d ":" -f3 | cut -c 1-45)
export procesoMasUsado=$(ps aux --sort -rss | head -2 | tail -1 | awk '{print $11,$6/1024}'| xargs basename)
export memoriaMasUsada=$(ps aux --sort -rss | head -2 | tail -1 | awk '{print $6/1024}')
export segundo_mas_usado=$(ps aux --sort -rss | head -3 | tail -1 | awk '{print $11,$6/1024}'| xargs basename)
export segundo_mas_usado_memoria=$(ps aux --sort -rss | head -3 | tail -1 | awk '{print $6/1024}')
export procesocpu=$(ps aux --sort -pcpu | head -2 | tail -1 | awk '{print $11,$3}'| xargs basename)
export cpuMasUsada=$(ps aux --sort -pcpu | head -2 | tail -1 | awk '{print $3}')
export porcentaje_segundo_mas_usado_cpu=$(ps aux --sort -pcpu | head -3 | tail -1 | awk '{print $3}')
export segundo_mas_usado_cpu_nombre=$(ps aux --sort -pcpu | head -3 | tail -1 | awk '{print $11}')
GREEN='\033[0;32m'

NC='\033[0m' # No Color

# formato
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
# Obtener el ancho de la pantalla
cols=$(tput cols)
cols=$((cols+12))
#verifico si esto conectado a internet con google.com
if ping -c 1 google.com &> /dev/null
then
    export ippublic=$(curl -s ifconfig.me)
    export ipv6=$(ip -6 addr show scope global | grep inet6 | awk '{print $2}' | head -n 1)
  else
    export ippublic="No hay conexión a internet"
    export ipv6="No hay conexión a internet"
fi



# Salida del sistema con emojis y formato
echo -e "。★  ˚ •    -   ˚ •。★˚˛˚  ${GREEN}${BOLD}       👤 Usuario:${NC} $USER | ${GREEN}${BOLD}💻 Hostname:${NC} $HOSTNAME " | cut -c -${cols}
echo -e "    _______|@|_________  • ${GREEN}${BOLD} ${NC}" | cut -c -${cols}
echo -e "   --------------------- ˚ ${GREEN}${BOLD} 🔧 SISTEMA OPERATIVO:${NC} $os" | cut -c -${cols}
echo -e "  ||  POLICE ---- BOX  ||  ${GREEN}${BOLD} 💾 CPU:${NC} $cpu" | cut -c -${cols}
echo -e "  -----------------------C ${GREEN}${BOLD} 🧠 RAM:${NC} $ram | $ram_used MB de $ram_total MB" | cut -c -${cols}
echo -e "  |  ______  |  ______  |É ${GREEN}${BOLD} 📊 PROCESOS:${NC} $processes" | cut -c -${cols}
echo -e "  |  |####|  |  |####|  |S ${GREEN}${BOLD} 🖥️  KERNEL:${NC} $kernel${NC}"| cut -c -${cols}
echo -e "  |  |####|  |  |####|  |A ${GREEN}${BOLD} ⏱️  TIEMPO DE ACTIVIDAD:${NC} $uptime" | cut -c -${cols}
echo -e "  |  |####|  |  |####|  |R ${GREEN}${BOLD} 📅 FECHA:${NC} $(date +"%d/%m/%Y") ${GREEN}${BOLD}| HORA:${NC} $(date +"%H:%M:%S")" | cut -c -${cols}
echo -e "% |  ------  |  ------  |˚ ${GREEN}${BOLD} 💾 USO DE CPU:${NC} $(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}')" | cut -c -${cols}
echo -e "  |  |BAD |  |  |    |  |˚ ${GREEN}${BOLD} 💽 USO DE DISCO:${NC} $disk libre de $(df -h / | awk 'NR==2{print $2}') ${NC}" | cut -c -${cols}
echo -e "  |  |WOLF|  |  |    |  |  ${GREEN}${BOLD} 🧑 Arquitectura:${NC} $arch ${NC}" | cut -c -${cols}
echo -e "  |  ------  |O ------  |  ${GREEN}${BOLD} 🏠 IP LOCAL:${NC} $iplocal ${NC}" | cut -c -${cols}
echo -e "  |  ------  |° ------  |  ${GREEN}${BOLD} 🌐 IP PUBLICA ${NC} $ippublic ${NC}" | cut -c -${cols}
echo -e "♥ |  |    |  |  |    |  |  ${GREEN}${BOLD} 🌐 IP v6 ${NC} $ipv6 ${NC}" | cut -c -${cols}
echo -e "L |  |    |  |  |    |  |•˛${GREEN}${BOLD} 🚀 GRAFICA:${NC} $tarjetaGrafica  ${NC}" | cut -c -${cols}
echo -e "A |  ------  |  ------  |。${GREEN}${BOLD} 🏋️  PROC. MEMORIA:${NC} $procesoMasUsado, $segundo_mas_usado ${NC} | ${GREEN}${BOLD}MEMORIA:${NC} $memoriaMasUsada MB, $segundo_mas_usado_memoria MB  ${NC}" |cut -c -${cols}
echo -e "U |  ------  |  ------  |• ${GREEN}${BOLD} 🔥 PROC. CPU:${NC} $procesocpu, $segundo_mas_usado_cpu_nombre ${NC} | ${GREEN}${BOLD}CPU:${NC} $cpuMasUsada%, $porcentaje_segundo_mas_usado_cpu%  ${NC}" |cut -c -${cols}
echo -e "♥ |  |    |  |  |    |  |˚•" | cut -c -${cols}
echo -e "˚ |  |    |  |  |    |  |•˚" | cut -c -${cols}
echo -e "  |  ------  |  ------  |  " | cut -c -${cols}
echo -e " _|_____________________|_ " | cut -c -${cols}
echo -e " |_______________________| " | cut -c -${cols}
