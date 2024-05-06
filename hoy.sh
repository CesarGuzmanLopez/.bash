#!/bin/bash

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

# Extrae la temperatura de la última hora
last_hour_temp=$(echo "$response" | jq -r '.forecast.forecastday[0].hour[0].temp_c')

echo "Temperatura de la última hora: ${last_hour_temp}°C"

# Extrae las temperaturas de las próximas 12 horas
echo "Temperaturas de las próximas 12 horas:"
echo "Hora | Temperatura (°C)"
echo "-----|-----------------"

for ((hour = 0; hour < 24; hour+=2)); do
    hour_temp=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].temp_c")
    hour_time=$(echo "$response" | jq -r ".forecast.forecastday[0].hour[$hour].time")

    # Formatea la hora en formato legible (opcional)
    hour_time_formatted=$hour_time

    echo "$hour_time_formatted | $hour_temp"
done
