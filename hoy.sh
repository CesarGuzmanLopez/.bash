#!/bin/bash

# Configuración por defecto
HOURS=12
STEP=1
SHOW_TEMPERATURE=true
SHOW_CLOUDS=false
SHOW_RAIN=false

# Funciones para obtener emojis
get_temp_emoji() {
    local temp=$1
    local emoji

    if (( $(echo "$temp > 25" | bc -l) )); then
        emoji="🔥"
    elif (( $(echo "$temp < 10" | bc -l) )); then
        emoji="❄️"
    else
        emoji="🌞"
    fi

    echo "$emoji"
}

get_rain_emoji() {
    local rain=$1
    local emoji

    if [ -n "$rain" ] && [ "$rain" -gt 50 ]; then
        emoji="🌧️"
    else
        emoji="☀️"
    fi
    echo "$emoji"
}

get_cloud_emoji() {
    local cloud=$1
    local emoji
    if [ -n "$cloud" ] && [ "$cloud" -gt 50 ]; then
        emoji="☁️"
    elif [ -n "$cloud" ] && [ "$cloud" -gt 25 ]; then
        emoji="⛅"
    else
        emoji="☀️"
    fi
    echo "$emoji"
}
get_is_day() {
    # fomrateo de la hora 12:00
    local hour_time=$1
    local emoji
    local hour=$(date -d "$hour_time" "+%H")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      emoji="🌞"
    else
      emoji="🌙"
    fi

    echo "$emoji"
}
# Procesar los parámetros de línea de comandos
while getopts "h:s:tcrap" opt; do
    case ${opt} in
        h )
            HOURS=$OPTARG
            ;;
        s )
            STEP=$OPTARG
            ;;
        t )
            SHOW_TEMPERATURE=true
            ;;
        c )
            SHOW_CLOUDS=true
            ;;
        r )
            SHOW_RAIN=true
            ;;
        a )
                SHOW_TEMPERATURE=true
                SHOW_CLOUDS=true
                SHOW_RAIN=true
            ;;              
        p )
            echo "Uso: $0 [-h horas] [-s paso] [-c {nubes}] [-r {lluvia}] [-t {temperatura}] [-a {todos}] [-p {help}]"
            exit 1
            ;;
    esac
done

# URL de ipinfo.io para obtener información geográfica basada en la IP actual
API_URL="https://ipinfo.io/json"

# Realiza la solicitud a ipinfo.io y obtiene la respuesta en formato JSON
response=$(curl -s "$API_URL")

# Extrae la latitud y longitud de la respuesta JSON
latitude=$(echo "$response" | jq -r '.loc | split(",")[0]')
longitude=$(echo "$response" | jq -r '.loc | split(",")[1]')

# Define la URL de la API y tu clave de API
API_URL="https://api.weatherapi.com/v1/forecast.json?key=${API_WHWATHERAPI_KEY}&q=${latitude},${longitude}&days=1&aqi=no&alerts=no"

# Realiza la solicitud a la API y obtiene la respuesta en formato JSON
response=$(curl -s "$API_URL")

# Imprime las condiciones para las próximas horas según los parámetros
echo "Condiciones para las próximas $HOURS horas con un paso de $STEP horas:"

# Construye la cabecera de la tabla según los comandos aceptados
table_header="Hora"
if [ "$SHOW_TEMPERATURE" = true ]; then
    table_header+=" | Temperatura (°C)"
fi
if [ "$SHOW_CLOUDS" = true ]; then
    table_header+=" | Nubosidad (%)"
fi
if [ "$SHOW_RAIN" = true ]; then
    table_header+=" | Lluvia (%)"
fi
echo "$table_header"

# Construye la línea de separación de la tabla
table_separator="-----"
if [ "$SHOW_TEMPERATURE" = true ]; then
    table_separator+="|-----------------"
fi
if [ "$SHOW_CLOUDS" = true ]; then
    table_separator+="|--------------"
fi
if [ "$SHOW_RAIN" = true ]; then
    table_separator+="|------------"
fi
echo "$table_separator"

# Imprime los datos para cada hora según los comandos aceptados
for ((hour = 0; hour < $HOURS; hour+=$STEP)); do
    hour_data=""

    # Formatea la hora en formato legible (opcional)
    hour_time=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].time")
    time=$(date -d "$hour_time" "+%H:%M")
    hour_data+="$time $(get_is_day "$time")"

    if [ "$SHOW_TEMPERATURE" = true ]; then
        hour_temp=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].temp_c")
        hour_data+=" | $hour_temp°C $(get_temp_emoji "$hour_temp")"
    fi

    if [ "$SHOW_CLOUDS" = true ]; then
        hour_cloud=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].cloud")
        hour_data+=" | $hour_cloud% $(get_cloud_emoji "$hour_cloud")"
    fi

    if [ "$SHOW_RAIN" = true ]; then
        hour_rain=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].chance_of_rain")
        hour_data+=" | $hour_rain% $(get_rain_emoji "$hour_rain")"
    fi

    echo "$hour_data"
done

