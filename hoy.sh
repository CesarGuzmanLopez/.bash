#!/bin/bash

# Configuración por defecto
HOURS=12
STEP=1
SHOW_TEMPERATURE=true
SHOW_CLOUDS=false
SHOW_RAIN=false
SHOW_WIND=false
SHOW_PRESSURE=false
SHOW_VISIBILITY=false

# Función para obtener emojis
get_emoji() {
    local value=$1
    local type=$2
    local emoji

    case $type in
        temp)
            emoji=$(awk 'BEGIN{print ("🔥", "🌞", "❄️")[$1 > 25 ? 1 : ($1 < 10 ? 2 : 3)]}' <<< "$value")
            ;;
        rain)
            emoji=$(awk 'BEGIN{print ("🌧️", "☀️")[$1 > 50 ? 1 : 2]}' <<< "$value")
            ;;
        cloud)
            emoji=$(awk 'BEGIN{print ("☁️", "⛅", "☀️")[$1 > 50 ? 1 : ($1 > 25 ? 2 : 3)]}' <<< "$value")
            ;;
        is_day)
            local hour=$(date -d "$value" "+%H")
            emoji=$(awk 'BEGIN{print ("🌞", "🌙")[$1 >= 6 && $1 < 18 ? 1 : 2]}' <<< "$hour")
            ;;
        wind)
            emoji=$(awk 'BEGIN{print ("🌬️", "💨", "🍃")[$1 > 30 ? 1 : ($1 > 10 ? 2 : 3)]}' <<< "$value")
            ;;
        pressure)
            emoji=$(awk 'BEGIN{print ("🌡️", "❗", "✔️")[$1 > 1013 ? 1 : ($1 < 1000 ? 2 : 3)]}' <<< "$value")
            ;;
        visibility)
            emoji=$(awk 'BEGIN{print ("🌫️", "🌁", "👀")[$1 < 5 ? 1 : ($1 < 10 ? 2 : 3)]}' <<< "$value")
            ;;
    esac

    echo "$emoji"
}

# Procesar los parámetros de línea de comandos
while getopts "h:s:tcrawpv" opt; do
    case ${opt} in
        h ) HOURS=$OPTARG ;;
        s ) STEP=$OPTARG ;;
        t ) SHOW_TEMPERATURE=true ;;
        c ) SHOW_CLOUDS=true ;;
        r ) SHOW_RAIN=true ;;
        w ) SHOW_WIND=true ;;
        p ) SHOW_PRESSURE=true ;;
        v ) SHOW_VISIBILITY=true ;;
        a ) SHOW_TEMPERATURE=true; SHOW_CLOUDS=true; SHOW_RAIN=true; SHOW_WIND=true; SHOW_PRESSURE=true; SHOW_VISIBILITY=true ;;
        \?|: ) echo "Uso: $0 [-h horas] [-s paso] [-c {nubes}] [-r {lluvia}] [-t {temperatura}] [-w {viento}] [-p {presión}] [-v {visibilidad}] [-a {todos}]"; exit 1 ;;
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

# Construir la cabecera de la tabla
table_header="Hora"
if [ "$SHOW_TEMPERATURE" = true ]; then table_header+="|Temperatura (°C)"; fi
if [ "$SHOW_CLOUDS" = true ]; then table_header+="|Nubosidad (%)"; fi
if [ "$SHOW_RAIN" = true ]; then table_header+="|Lluvia (%)"; fi
if [ "$SHOW_WIND" = true ]; then table_header+="|Viento (km/h)"; fi
if [ "$SHOW_PRESSURE" = true ]; then table_header+="|Presión (hPa)"; fi
if [ "$SHOW_VISIBILITY" = true ]; then table_header+="|Visibilidad (km)"; fi

# Construir la línea de separación de la tabla
table_separator=$(echo "$table_header" | sed 's/./-/g')

# Imprime la cabecera de la tabla
echo "$table_header" | column -t -s '|'
echo "$table_separator"

# Imprime los datos para cada hora según los comandos aceptados
for ((hour = 0; hour < $HOURS; hour+=$STEP)); do
    hour_data=""
    hour_time=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].time")
    time=$(date -d "$hour_time" "+%H:%M")
    hour_data+="$time $(get_emoji "$time" "is_day")"

    if [ "$SHOW_TEMPERATURE" = true ]; then
        hour_temp=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].temp_c")
        hour_data+="|$(printf "%5s" "$hour_temp")°C $(get_emoji "$hour_temp" "temp")"
    fi

    if [ "$SHOW_CLOUDS" = true ]; then
        hour_cloud=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].cloud")
        hour_data+="|$(printf "%5s" "$hour_cloud")% $(get_emoji "$hour_cloud" "cloud")"
    fi

    if [ "$SHOW_RAIN" = true ]; then
        hour_rain=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].chance_of_rain")
        hour_data+="|$(printf "%5s" "$hour_rain")% $(get_emoji "$hour_rain" "rain")"
    fi

    if [ "$SHOW_WIND" = true ]; then
        hour_wind=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].wind_kph")
        hour_data+="|$(printf "%5s" "$hour_wind") km/h $(get_emoji "$hour_wind" "wind")"
    fi

    if [ "$SHOW_PRESSURE" = true ]; then
        hour_pressure=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].pressure_mb")
        hour_data+="|$(printf "%5s" "$hour_pressure") hPa $(get_emoji "$hour_pressure" "pressure")"
    fi

    if [ "$SHOW_VISIBILITY" = true ]; then
        hour_visibility=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].vis_km")
        hour_data+="|$(printf "%5s" "$hour_visibility") km $(get_emoji "$hour_visibility" "visibility")"
    fi

    echo "$hour_data" | column -t -s '|'
done

